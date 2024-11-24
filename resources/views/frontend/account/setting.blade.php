@extends('frontend.master')

@section('content')
<section id="blog_posts">
    <div class="bg">
        <div class="container">

            @if (session('success'))
            <div id="floating-alert" class="alert alert-success text-dark alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            @endif


            <div class="row gy-3">

                <div class="col-md-4">
                    <div class="account-links shadow-sm h-100">
                        <h3>Update your Account</h3>
                        <p>Edit your personal details - {{ Auth::user()->name }} </p>

                        <nav class="nav flex-column">
                            <a class="nav-link active" href="{{ route('account') }}"><i
                                    class="fas fa-cog"></i>Setting</a>
                            <a class="nav-link" href="{{ route('my-memorial') }}"><i class="fas fa-newspaper"></i></i>My
                                Memorial</a>
                            <a class="nav-link" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i
                                    class="fas fa-sign-out-alt"></i>Logout</a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="display: none;">
                                @csrf
                            </form>
                        </nav>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card shadow-sm pb-3" style="border-radius: 32px">
                        <form class="setting-form pb-3" action="{{ route('account.store') }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="row">
                                            <div class="col-md-5 mb-4 mx-auto text-center">
                                                <img src="{{ asset(Auth::user()->getAvatar()) }}" alt=""
                                                    style="height: 70px; width: 70px; border-radius: 50%;">
                                            </div>
                                        </div>


                                        @if (auth()->user()->provider === null)
                                        <div class="mb-2">
                                            <p class="form-label d-block">Update Avatar</p>

                                            <label class="form-control text-muted d-flex align-items-center"
                                                for="customSingleFile"
                                                style="cursor: pointer; border-radius: 12px; border: 1px solid #FBA8B2; padding-block: 12px;"
                                                id="singleFileLabel">
                                                <i class="fas fa-upload me-3" style="color: #FBA8B2;"></i>Photo
                                                <small id="singleFileCount"
                                                    style="margin-left: auto; color: #FBA8B2;">Select</small>
                                            </label>
                                            <input type="file" id="customSingleFile" name="avatar"
                                                class="form-control d-none" accept="image/x-png,image/jpeg"
                                                onchange="previewImages(this)">

                                            <div id="singlePreviewContainer"
                                                style="display: flex; gap: 6px; margin-top: 10px; flex-wrap: wrap;">
                                            </div>
                                        </div>
                                        @endif



                                        {{-- <div class="mb-2">
                                                   <p class="form-label d-block">Update Avatar</p>
                                                    <!-- Label for custom file input -->
                                                    <label
                                                        class="form-control text-muted form-file-controll @error('avatar') is-invalid @enderror d-flex align-items-center"
                                                        for="customFile"
                                                        style="cursor: pointer; border-radius: 12px; border: 1px solid #FBA8B2;"
                                                        id="fileLabel">
                                                        <i class="fas fa-upload me-3" style="color: #FBA8B2;"></i>
                                                        {{ __('app.photo') }}
                                        <span id="fileCount" style="margin-left: auto; color: #FBA8B2;"></span>
                                        </label>
                                        <input type="file" id="customFile" name="avatar"
                                            class="form-control custom-file-input @error('avatar') is-invalid @enderror d-none"
                                            accept="image/x-png,image/jpeg">

                                        <!-- Error message for file input -->
                                        @error('avatar')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div> --}}


                                    {{-- <div class="input-group mb-2">
                                                    <label
                                                        class="form-control text-muted form-file-controll @error('avatar') is-invalid @enderror d-flex align-items-center"
                                                        for="customFile" style="cursor: pointer; border-radius: 12px"
                                                        id="fileLabel">
                                                        <i class="fas fa-upload me-3" style="color: #FBA8B2;"></i> Update
                                                        Avatar
                                                    </label>
                                                    <input type="file" id="customFile" class="d-none" name="avatar">

                                                    @error('avatar')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div> --}}


                                <div class="mb-2">
                                    <div class="input">
                                        <div class="form-outline position-relative">
                                            <input type="text"
                                                class="form-control @error('name') is-invalid @enderror ps-5" id="name"
                                                name="name"
                                                value="{{ !empty(old('name')) ? old('name') : Auth::user()->name }}"
                                                autocomplete="name" autofocus placeholder="Name" readonly>
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
                                    <div class="row align-items-center">
                                        <div class="col-md-10">
                                            <div class="input">
                                                <div class="form-outline position-relative">
                                                    <input type="text"
                                                        class="form-control @error('email') is-invalid @enderror ps-5"
                                                        id="email" name="email"
                                                        value="{{ !empty(old('email')) ? old('email') : Auth::user()->email }}"
                                                        autocomplete="email" autofocus placeholder="E-mail" readonly>
                                                    <i class="far fa-envelope ms-3"></i>
                                                </div>
                                            </div>

                                            @error('email')
                                            <span class="text-danger ms-1">
                                                <small>{{ $message }}</small>
                                            </span>
                                            @enderror
                                        </div>

                                        <div class="col-md-2">
                                            @if (!auth()->user()->hasVerifiedEmail())
                                            <button type="submit" name="resend_verification"
                                                class="btn btn-sm text-muted"><i class="fas fa-user-times"></i>
                                                <u class="d-block link-underline">Verify
                                                    now</u></button>
                                            @else
                                            <p class="text-center text-warning m-0"><i class="fas fa-user-check"></i>
                                                <span class="d-block">Verified</span>
                                            </p>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-2">
                                    @if (auth()->user()->provider === null)
                                    @if (auth()->user()->hasVerifiedEmail())
                                    @if (auth()->user()->otp && auth()->user()->otp->is_active)
                                    <a name="resend_verification" href="{{ route('disableOtp') }}"
                                        class="btn btn-light btn-sm">
                                        <i class="fas fa-unlock"></i>
                                        <u class="d-block link-underline">Disable 2fa</u>
                                    </a>
                                    @else
                                    <a name="resend_verification" href="{{ route('enable_otp') }}"
                                        class="btn btn-light btn-sm">
                                        <i class="fas fa-lock"></i>
                                        <u class="d-block link-underline">Enable 2fa</u>
                                    </a>
                                    @endif
                                    @endif
                                    @endif
                                </div>


                                <div class="hr-text hr-text-left pt-4">Change Password</div>
                                <hr>


                                <!-- Password -->
                                <div class="mb-2">
                                    <div class="input">
                                        <div class="form-outline position-relative">
                                            <input type="new_password"
                                                class="form-control @error('new_password') is-invalid @enderror ps-5"
                                                id="new_password" name="new_password" value="{{ old('new_password') }}"
                                                autocomplete="off" autofocus placeholder="New Password">
                                            <i class="fas fa-lock ms-3"></i>
                                        </div>
                                    </div>

                                    @error('new_password')
                                    <span class="text-danger ms-1">
                                        <small>{{ $message }}</small>
                                    </span>
                                    @enderror
                                </div>

                                <div class="mb-4">
                                    <div class="input">
                                        <div class="form-outline position-relative">
                                            <input type="password"
                                                class="form-control @error('new_confirm_password') is-invalid @enderror ps-5"
                                                placeholder="Password New Repeat" name="new_confirm_password"
                                                autocomplete="off" autofocus>
                                            <i class="fas fa-lock ms-3"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="pt-2">
                            <button type="submit" class="btn form-btn ms-3">Update</button>
                        </div>
                    </div>
                </div>

                </form>
            </div>
        </div>

    </div>

    </div>
    </div>
</section>
@endsection