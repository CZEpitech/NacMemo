<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Flasher\Prime\FlasherInterface;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('frontend.auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request, FlasherInterface $flasher)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', 'confirmed', Rules\Password::min(8)],
            'terms' => 'accepted',
            // 'g-recaptcha-response' => 'required|captcha'
        ]);

        $user = User::create([
            'name' => str_replace(' ', '', $request->name),
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $user->assignRole('user');

        event(new Registered($user));

        Auth::login($user);

        $successMessage = DB::table('success_messages')
            ->where('key', 'registration_success')
            ->value('message');

        $flasher->addInfo($successMessage, 'Success!', [
            'position' => 'top-center',
            'timer' => 5000,
            'icon' => 'check-circle'
        ]);

        return redirect(RouteServiceProvider::HOME);
    }
}
