<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use App\Http\Controllers\Auth\AccountController;
use App\Http\Controllers\InsertController;
use App\Http\Controllers\OtpController;
use Illuminate\Support\Facades\Route;

Route::get('/profile/{id}/{name}', [AccountController::class, 'profile'])
    ->name('profile');

Route::get('/account', [AccountController::class, 'index'])
    ->middleware('auth')
    ->name('account');

Route::get('/account/my-memorial', [AccountController::class, 'my_memorial'])
    ->middleware('auth')
    ->name('my-memorial');

Route::get('/account/edit-memorial/{item}', [AccountController::class, 'edit_memorial'])
    ->middleware('auth')
    ->name('edit-memorial');

Route::post('/account/update-memorial/{id}', [InsertController::class, 'update'])
    ->middleware('auth')
    ->name('update-memorial');

Route::post('/account', [AccountController::class, 'store'])
    ->middleware('auth')
    ->name('account.store');

Route::get('/register', [RegisteredUserController::class, 'create'])
    ->middleware('guest')
    ->name('register');

Route::post('/register', [RegisteredUserController::class, 'store'])
    ->middleware('guest');

Route::get('/login', [AuthenticatedSessionController::class, 'create'])
    ->middleware('guest')
    ->name('login');

Route::post('/login', [AuthenticatedSessionController::class, 'store'])
    ->middleware('guest');

Route::get('/forgot-password', [PasswordResetLinkController::class, 'create'])
    ->middleware('guest')
    ->name('password.request');

Route::post('/forgot-password', [PasswordResetLinkController::class, 'store'])
    ->middleware('guest')
    ->name('password.email');

Route::get('/reset-password/{token}', [NewPasswordController::class, 'create'])
    ->middleware('guest')
    ->name('password.reset');

Route::post('/reset-password', [NewPasswordController::class, 'store'])
    ->middleware('guest')
    ->name('password.update');

Route::get('/verify-email', [EmailVerificationPromptController::class, '__invoke'])
    ->middleware('auth')
    ->name('verification.notice');

Route::get('/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
    ->middleware(['auth', 'signed', 'throttle:6,1'])
    ->name('verification.verify');

Route::post('/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
    ->middleware(['auth', 'throttle:6,1'])
    ->name('verification.send');

Route::get('/confirm-password', [ConfirmablePasswordController::class, 'show'])
    ->middleware('auth')
    ->name('password.confirm');

Route::post('/confirm-password', [ConfirmablePasswordController::class, 'store'])
    ->middleware('auth');

Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware(['auth', 'disconnect'])
    ->name('logout');

Route::get('/enable_otp', [OtpController::class, 'enableOtp'])
    ->middleware('auth')
    ->name('enable_otp');

Route::get('/disableOtp', [OtpController::class, 'disableOtp'])
    ->middleware('auth')
    ->name('disableOtp');

Route::get('/otpVerify', [OtpController::class, 'otpVerify'])
    ->name('otp.verify')->middleware('checkOtpSession');

Route::post('/otpVerify/post', [OtpController::class, 'otpVerified'])
    ->name('otp.verify.post')->middleware('checkOtpSession');