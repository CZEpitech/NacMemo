<?php

namespace Illuminate\Auth\Middleware;

use Closure;
use Flasher\Prime\FlasherInterface;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\URL;

class EnsureEmailIsVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $redirectToRoute
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse|null
     */

    public $flasher;

    public function __construct(FlasherInterface $flasher)
    {
        $this->flasher = $flasher;
    }

    public function handle($request, Closure $next, $redirectToRoute = null)
    {
        if (
            !$request->user() ||
            ($request->user() instanceof MustVerifyEmail &&
                !$request->user()->hasVerifiedEmail())
        ) {
            if (!$request->expectsJson()) {

                $successMessage = DB::table('success_messages')
                    ->where('key', 'user_unverify')
                    ->value('message');

                $this->flasher->addInfo($successMessage, 'Verify Now!', [
                    'position' => 'top-center',
                    'timer' => 5000,
                    'icon' => 'check-circle'
                ]);

                return Redirect::guest(URL::route($redirectToRoute ?: 'account'));
            }

            return abort(403, 'Your email address is not verified.');
        }

        return $next($request);
    }
}
