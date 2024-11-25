<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp - Nac.Memorial</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/frontend/images/favicon.ico') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
        integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap');
    </style>

    <style>
        a {
            text-decoration: none;
        }

        body {
            background-color: #f9e5d0;
            font-family: "DM Sans", sans-serif;
        }

        .form-image {
            border: 1px solid #676D75;
            border-radius: 24px;
            padding: 100px 70px;
        }

        .form-text {
            font-size: 20px;
            font-weight: 400;
            color: #252525;
            text-align: center;
            padding-top: 50px;
        }

        .login-form-container {
            padding: 23px 45px;
        }

        .login-form-container .login-text {
            text-align: center;
            padding-top: 60px;
            padding-bottom: 20px;
        }

        .login-form-container .login-text h3 {
            font-size: 32px;
            font-weight: 500;
            color: #252525;
        }

        .login-form-container .login-text p {
            font-size: 18px;
            font-weight: 400;
            color: #252525;
        }

        .login-form-container .form {
            width: 404px;
        }

        .form-outline .form-control {
            padding-top: 13px;
            padding-bottom: 13px;
            border-radius: 12px;
        }

        .form-outline i {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
            color: #FBA8B2;
            font-size: 19px;
        }

        .form-check-input {
            transform: scale(1.1);
        }

        .form-check-input:checked {
            background-color: #FBE8D2;
            border-color: #FBA8B2;
        }

        .form-check-input {
            background-color: white;
            border: 2px solid #ccc;
        }

        .form-check-input:focus {
            box-shadow: none;
        }

        .remember-me {
            font-size: 14px;
            font-weight: 400;
            color: #252525;
        }

        .forgot {
            font-size: 14px;
            font-weight: 400;
            color: #252525;
            text-decoration: none;
        }

        .form-btn {
            padding: 13px 0;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 12px;
        }

        .form-btn:hover {
            background: #f9e5d0;
            color: #252525 !important;
        }

        .form-btn.login-btn {
            background: #FBA8B2;
            color: #fff;
        }

        .form-btn.social-btn {
            border: 1px solid #E8ECF4;
        }

        .form-btn:hover {
            background: #FBE8D2;
        }

        .condition a {
            position: relative;
        }

        .condition a:last-child::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 7px;
            height: 5px;
            width: 5px;
            border-radius: 50%;
            background: #252525;
        }

        .recaptcha-container {
            width: 100%;
        }

        .g-recaptcha {
            transform: scale(0.9);
            transform-origin: 0 0;
            width: 100%;
        }

        @media only screen and (max-width: 575px) {
            .login-form-container .form {
                width: auto;
            }

            .login-form-container .login-text p {
                font-size: 14px;
            }

            .login-form-container .login-text h3 {
                font-size: 20px;
            }

            .login-form-container .login-text {
                padding-top: 40px;
                padding-bottom: 20px;
            }
        }

        @media only screen and (min-width: 576px) and (max-width: 767.98px) {
            .login-form-container .form {
                width: auto;
            }

            .login-form-container .login-text p {
                font-size: 14px;
            }

            .login-form-container .login-text h3 {
                font-size: 20px;
            }

            .login-form-container .login-text {
                padding-top: 40px;
                padding-bottom: 20px;
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 991.98px) {
            .login-form-container .form {
                width: auto;
            }

            .login-form-container .login-text p {
                font-size: 14px;
            }

            .login-form-container .login-text h3 {
                font-size: 20px;
            }

            .login-form-container .login-text {
                padding-top: 40px;
                padding-bottom: 20px;
            }
        }
    </style>
</head>

<body>

    <section class="vh-100 overflow-auto">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-7 align-items-center justify-content-center d-none d-md-flex">
                    <div class="form-image text-center">
                        <img src="{{ asset('assets/frontend/images/register.png') }}"
                            style="height: 250px; width: auto;" class="img-fluid" alt="Sample image">
                        <p class="form-text">Add memorials of your loved pets</p>
                    </div>
                </div>
                <div class="col-md-5 bg-white vh-100 overflow-auto">
                    <div class="login-form-container">
                        <div class="logo">
                            <a href="{{ route('index') }}">
                                <img src="{{ asset('assets/frontend/images/logo.png') }}"
                                    style="height: 24px; width: auto;" alt="1">
                            </a>
                        </div>
                        <div class="login-text">
                            <h3>
                                Create new account
                            </h3>
                            <p>Welcome! Please enter your details</p>
                        </div>
                        <form class="form mx-auto" action="{{ route('register') }}" method="post">
                            {{ csrf_field() }}
                            <!-- Name input -->
                            <div class="mb-2">
                                <div class="input">
                                    <div class="form-outline position-relative">
                                        <input type="text"
                                            class="form-control @error('name') is-invalid @enderror ps-5" id="name"
                                            name="name" value="{{ old('name') }}" autocomplete="name" autofocus
                                            placeholder="Name">
                                        <i class="far fa-user ms-3"></i>
                                    </div>
                                </div>

                                @error('name')
                                    <span class="text-danger ms-1">
                                        <small>{{ $message }}</small>
                                    </span>
                                @enderror
                            </div>
                            <!-- Email input -->
                            <div class="mb-2">
                                <div class="input">
                                    <div class="form-outline position-relative">
                                        <input type="text"
                                            class="form-control @error('email') is-invalid @enderror ps-5"
                                            id="email" name="email" value="{{ old('email') }}"
                                            autocomplete="email" autofocus placeholder="E-mail">
                                        <i class="far fa-envelope ms-3"></i>
                                    </div>
                                </div>

                                @error('email')
                                    <span class="text-danger ms-1">
                                        <small>{{ $message }}</small>
                                    </span>
                                @enderror
                            </div>
                            <!-- Password -->
                            <div class="mb-2">
                                <div class="input">
                                    <div class="form-outline position-relative">
                                        <input type="password"
                                            class="form-control @error('password') is-invalid @enderror ps-5"
                                            id="password" name="password" value="{{ old('password') }}"
                                            autocomplete="off" autofocus placeholder="Password">
                                        <i class="fas fa-lock ms-3"></i>
                                    </div>
                                </div>

                                @error('password')
                                    <span class="text-danger ms-1">
                                        <small>{{ $message }}</small>
                                    </span>
                                @enderror
                            </div>

                            <div class="mb-4">
                                <div class="input">
                                    <div class="form-outline position-relative">
                                        <input type="password" class="form-control ps-5" placeholder="Password Repeat"
                                            name="password_confirmation" autocomplete="off" autofocus>
                                        <i class="fas fa-lock ms-3"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input type="checkbox" class="form-check-input @error('terms') is-invalid @enderror"
                                        name="terms" id="terms" />
                                    <label class="form-check-label remember-me" for="terms">
                                        Agree to our <a class="link-danger ps-2" href="{{ route('terms') }}">Terms and
                                            Conditions &
                                            Privacy Policy</a>
                                    </label>
                                </div>
                            </div>

                            <div class="my-3">
                                <div class="recaptcha-container">
                                    {!! NoCaptcha::display() !!}
                                    @error('g-recaptcha-response')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <div class="d-grid">

                                    <button type="submit" class="btn form-btn login-btn">Login</button>

                                    <p class="text-center pt-3 pb-2">Or Login With</p>

                                    <a href="{{ route('socialite.redirect', 'facebook') }}"
                                        class="btn social-btn form-btn mb-2">
                                        <img src="{{ asset('assets/frontend/images/facebook_ic.png') }}"
                                            style="height: 25px; width: 25px;" alt="">
                                        Continue with Facebook
                                    </a>

                                    <a href="{{ route('socialite.redirect', 'google') }}"
                                        class="btn social-btn form-btn">
                                        <img src="{{ asset('assets/frontend/images/google_ic.png') }}"
                                            style="height: 25px; width: 25px;" alt="">
                                        Continue with Google
                                    </a>
                                </div>


                                <p class="small fw-bold mt-2 pt-1 mt-4 text-center">Already have an account?
                                    <a href="{{ route('login') }}" class="link-danger ps-2">Login Now</a>
                                </p>

                                <p class="text-center pt-5 mt-3 condition">
                                    <a class="small mt-2 pt-1 mt-4" href="{{ route('terms') }}"
                                        style="color: #252525">Terms and
                                        Conditions</a>
                                    <a class="small mt-2 pt-1 mt-4 ps-4" href="{{ route('terms') }}"
                                        style="color: #252525">Privacy
                                        Policy</a>
                                </p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    {!! NoCaptcha::renderJs() !!}
</body>

</html>
