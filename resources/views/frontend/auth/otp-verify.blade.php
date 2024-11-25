<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Nac.Memorial</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/frontend/images/favicon.ico') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" />
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
                        <img src="{{ asset('assets/frontend/images/login.png') }}" style="height: 250px; width: auto;"
                            class="img-fluid" alt="Sample image">
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
                                OTP Code
                            </h3>
                            <p>Type the code we have sent you on your registered email</p>
                        </div>
                        <form class="form mx-auto" method="POST" action="{{ route('otp.verify.post') }}">
                            @csrf
                            <!-- Email input -->
                            <div class="mb-2">
                                <div class="input">
                                    <div class="form-outline position-relative">
                                        <input type="text" id="otp"
                                            class="form-control @error('otp') is-invalid @enderror ps-5"
                                            placeholder="OTP" name="otp" autocomplete="otp" autofocus>
                                        <i class="fas fa-lock ms-3"></i>
                                    </div>
                                </div>

                                @error('otp')
                                    <span class="text-danger ms-1">
                                        <small>{{ $message }}</small>
                                    </span>
                                @enderror
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <div class="d-grid">

                                    <button type="submit" class="btn form-btn login-btn">Submit Code</button>

                                    <small class="text-muted text-center mt-4">Code expaired in 2 minute</small>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
