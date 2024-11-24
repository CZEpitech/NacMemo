<?php

/*
 * This file is part of the PHPFlasher package.
 * (c) Younes KHOUBZA <younes.khoubza@gmail.com>
 */

namespace Flasher\Prime\Aware;

use Flasher\Prime\FlasherInterface;

interface FlasherAwareInterface
{
    /**
     * @return void
     */
    public function setFlasher(FlasherInterface $flasher);
}
