@extends('admin.layouts.app')
@section('content')
    <!-- Latest obituaries -->
    <div class="container-xl">
        <!-- Page title -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-title text-muted">
                        {{ __('Settings') }}
                    </div>
                    <span class="card-subtitle">
                        {{ __('Take control of your web application.') }}
                    </span>
                </div>
                <!-- Page title actions -->
                <div class="col-auto ms-auto d-print-none">
                    <div class="btn-list">

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
            <form method="post" action="{{ route('admin.user.update', $user->id) }}">
                @csrf
                <div class="card">
                    <div class="card-header">
                        <h2 class="card-title">
                            {{ __('Edit User') }}
                        </h2>
                    </div>
                    <div class="card-body">

                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{{ __('Avatar') }}</label>
                            <div class="col">
                                <span class="avatar avatar-lg rounded"
                                    style="background-image: url({{ asset($user->getAvatar()) }})"></span>
                            </div>
                        </div>

                        <!-- Add checkbox to remove avatar -->
                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{{ __('Remove Avatar') }}</label>
                            <div class="col">
                                <input type="checkbox" name="remove_avatar" id="remove_avatar" class="form-check-input">
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{{ __('Username') }}</label>
                            <div class="col">
                                <input type="text" class="form-control @error('name') is-invalid @enderror"
                                    value="{{ !empty(old('name')) ? old('name') : $user->name }}" name="name">

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{{ __('Email') }}</label>
                            <div class="col">
                                <input type="email" class="form-control @error('email') is-invalid @enderror"
                                    value="{{ !empty(old('email')) ? old('email') : $user->email }}" name="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{{ __('Manually Verify Email') }}</label>
                            <div class="col">
                                <input type="checkbox" name="verify_email" id="verify_email" class="form-check-input"
                                    {{ old('verify_email', $user->hasVerifiedEmail()) ? 'checked' : '' }}>
                            </div>
                        </div>

                        <div class="hr-text">{{ __('Change Password') }}</div>

                        <div class="form-group mb-3 row">
                            <label for="password" class="form-label col-3 col-form-label">
                                {{ __('New Password') }}
                            </label>
                            <div class="col">
                                <input id="new_password" type="password"
                                    class="form-control @error('new_password') is-invalid @enderror" name="new_password"
                                    autocomplete="new-password" value="{{ old('new_password') }}">

                                @error('new_password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <label for="new_confirm_password" class="form-label col-3 col-form-label">
                                {{ __('Confirm New Password') }}
                            </label>
                            <div class="col">
                                <input id="new_confirm_password" type="password" class="form-control"
                                    name="new_confirm_password" autocomplete="new_confirm_password">
                            </div>
                        </div>

                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-lime">{{ __('Update') }}</button>
                    </div>
            </form>

        </div>
    </div>
    </div>
@endsection
