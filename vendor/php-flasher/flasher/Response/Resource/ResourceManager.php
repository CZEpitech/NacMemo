<?php

/*
 * This file is part of the PHPFlasher package.
 * (c) Younes KHOUBZA <younes.khoubza@gmail.com>
 */

namespace Flasher\Prime\Response\Resource;

use Flasher\Prime\Config\Config;
use Flasher\Prime\Config\ConfigInterface;
use Flasher\Prime\Notification\Envelope;
use Flasher\Prime\Response\Response;
use Flasher\Prime\Stamp\HandlerStamp;
use Flasher\Prime\Stamp\ViewStamp;
use Flasher\Prime\Template\TemplateEngineInterface;

final class ResourceManager implements ResourceManagerInterface
{
    /**
     * @var ConfigInterface
     */
    private $config;

    /**
     * @var TemplateEngineInterface|null
     */
    private $templateEngine;

    /**
     * @var array<string, string[]>
     */
    private $scripts = array();

    /**
     * @var array<string, string[]>
     */
    private $styles = array();

    /**
     * @var array<string, array<string, mixed>>
     */
    private $options = array();

    public function __construct(ConfigInterface $config = null, TemplateEngineInterface $templateEngine = null)
    {
        $this->config = $config ?: new Config();
        $this->templateEngine = $templateEngine;
    }

    /**
     * {@inheritdoc}
     */
    public function buildResponse(Response $response)
    {
        $rootScript = $this->selectAssets($this->config->get('root_script'));
        $rootScript = is_string($rootScript) ? $rootScript : null;

        $response->setRootScript($rootScript);

        $handlers = array();
        foreach ($response->getEnvelopes() as $envelope) {
            $handler = $this->resolveHandler($envelope);
            if (null === $handler || \in_array($handler, $handlers, true)) {
                continue;
            }
            $handlers[] = $handler;

            $this->populateResponse($response, $handler);
        }

        return $response;
    }

    /**
     * {@inheritdoc}
     */
    public function addScripts($handler, array $scripts)
    {
        $this->scripts[$handler] = $scripts;
    }

    /**
     * {@inheritdoc}
     */
    public function addStyles($handler, array $styles)
    {
        $this->styles[$handler] = $styles;
    }

    /**
     * {@inheritdoc}
     */
    public function addOptions($handler, array $options)
    {
        $this->options[$handler] = $options;
    }

    /**
     * @return ConfigInterface
     */
    public function getConfig()
    {
        return $this->config;
    }

    /**
     * @param mixed $assets
     *
     * @return string[]|string
     */
    private function selectAssets($assets)
    {
        $use = $this->config->get('use_cdn', true) ? 'cdn' : 'local';

        return is_array($assets) && array_key_exists($use, $assets) ? $assets[$use] : $assets;
    }

    /**
     * @return string|null
     */
    private function resolveHandler(Envelope $envelope)
    {
        $handlerStamp = $envelope->get('Flasher\Prime\Stamp\HandlerStamp');
        if (!$handlerStamp instanceof HandlerStamp) {
            return null;
        }

        $handler = $handlerStamp->getHandler();
        if ('flasher' !== $handler && 0 !== strpos($handler, 'theme.')) {
            return $handler;
        }

        $theme = $this->getTheme($handler);
        if (null === $theme) {
            return $handler;
        }

        if (!isset($this->scripts[$handler])) {
            $scripts = $this->config->get('themes.'.$theme.'.scripts', array());
            $this->addScripts('theme.'.$theme, (array) $scripts);
        }

        if (!isset($this->styles[$handler])) {
            $styles = $this->config->get('themes.'.$theme.'.styles', array());
            $this->addStyles('theme.'.$theme, (array) $styles);
        }

        if (!isset($this->options[$handler])) {
            $options = $this->config->get('themes.'.$theme.'.options', array());
            $this->addOptions('theme.'.$theme, $options);
        }

        if ('flasher' === $theme) {
            $scripts = $this->config->get('scripts', array());

            if (isset($this->scripts['theme.flasher'])) {
                $scripts = array_merge($this->scripts['theme.flasher'], $scripts);
            }

            if (isset($this->scripts['flasher'])) {
                $scripts = array_merge($this->scripts['flasher'], $scripts);
            }

            $this->addScripts('theme.flasher', (array) $scripts);

            $styles = $this->config->get('styles', array());
            if (isset($this->styles['theme.flasher'])) {
                $styles = array_merge($this->styles['theme.flasher'], $styles);
            }
            if (isset($this->scripts['flasher'])) {
                $styles = array_merge($this->styles['flasher'], $styles);
            }
            $this->addStyles('theme.flasher', (array) $styles);

            $options = $this->config->get('options', array());
            if (isset($this->options['theme.flasher'])) {
                $options = array_merge($this->options['theme.flasher'], $options);
            }
            if (isset($this->options['flasher'])) {
                $options = array_merge($this->options['flasher'], $options);
            }
            $this->addOptions('theme.flasher', $options);
        }

        /** @var string|null $view */
        $view = $this->config->get('themes.'.$theme.'.view');
        if (null === $view || null === $this->templateEngine) {
            return 'theme.'.$theme;
        }

        $compiled = $this->templateEngine->render($view, array('envelope' => $envelope));
        $envelope->withStamp(new ViewStamp($compiled));

        return 'theme.'.$theme;
    }

    /**
     * @param string $handler
     *
     * @return string|null
     */
    private function getTheme($handler)
    {
        if ('flasher' === $handler) {
            return 'flasher';
        }

        if (0 === strpos($handler, 'theme.')) {
            return substr($handler, \strlen('theme.'));
        }

        return null;
    }

    /**
     * @param string $handler
     *
     * @return void
     */
    private function populateResponse(Response $response, $handler)
    {
        if (isset($this->scripts[$handler])) {
            $scripts = $this->selectAssets($this->scripts[$handler]);
            $scripts = is_array($scripts) ? $scripts : array();

            $response->addScripts($scripts);
        }

        if (isset($this->styles[$handler])) {
            $styles = $this->selectAssets($this->styles[$handler]);
            $styles = is_array($styles) ? $styles : array();

            $response->addStyles($styles);
        }

        if (isset($this->options[$handler])) {
            $response->addOptions($handler, $this->options[$handler]);
        }
    }
}
