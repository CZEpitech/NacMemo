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
                            <a class="nav-link active" href="{{ route('account') }}"><i class="fas fa-cog"></i>
                                Settings</a>
                            <a class="nav-link" href="{{ route('my-memorial') }}"><i class="fas fa-newspaper"></i> My
                                Memorial</a>
                            <a class="nav-link" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i
                                    class="fas fa-sign-out-alt"></i> Logout</a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
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
                                            
                                            <div class="col-md-5 mb-4 mx-auto text-center position-relative">
                                            <div class="image-wrapper position-relative">
        <img src="{{ asset(Auth::user()->getAvatar()) }}" alt="Avatar"
        class="avatar-image">



                                                @if (Auth::user()->avatar)
                                                @if (auth()->user()->provider === null)
                                                <button type="button" class="remove-avatar-btn" onclick="removeAvatar()">×</button>
                                                @endif
                                                @endif
                                            </div>
                                            </div>

                                        </div>

                                        {{-- Champ caché pour indiquer la suppression de l'avatar --}}
                                        <input type="hidden" name="remove_avatar" id="remove_avatar" value="false">

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
                                                class="form-control d-none" accept="image/*"
                                                onchange="previewImages(this)">

                                            <div id="singlePreviewContainer"
                                                style="display: flex; gap: 6px; margin-top: 10px; flex-wrap: wrap;">
                                            </div>
                                        </div>
                                        @endif

                                        <!-- Autres champs du formulaire -->

                                        <div class="mb-2">
                                            <div class="input">
                                                <div class="form-outline position-relative">
                                                    <input type="text"
                                                        class="form-control @error('name') is-invalid @enderror ps-5"
                                                        id="name" name="name"
                                                        value="{{ old('name', Auth::user()->name) }}"
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
                                                            <input type="email"
                                                                class="form-control @error('email') is-invalid @enderror ps-5"
                                                                id="email" name="email"
                                                                value="{{ old('email', Auth::user()->email) }}"
                                                                autocomplete="email" placeholder="E-mail" readonly>
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
                                                    <p class="text-center text-warning m-0"><i
                                                            class="fas fa-user-check"></i>
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
                                                <u class="d-block link-underline">Disable 2FA</u>
                                            </a>
                                            @else
                                            <a name="resend_verification" href="{{ route('enable_otp') }}"
                                                class="btn btn-light btn-sm">
                                                <i class="fas fa-lock"></i>
                                                <u class="d-block link-underline">Enable 2FA</u>
                                            </a>
                                            @endif
                                            @endif
                                            @endif
                                        </div>


                                        <div class="mb-3">
                                            <label class="form-label">Enable Comment Notifications</label>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox"
                                                    id="notification_comment" name="notification_comment" value="1"
                                                    {{ Auth::user()->notification_comment ? 'checked' : '' }}>
                                                <label class="form-check-label" for="notification_comment">Yes</label>
                                            </div>
                                        </div>

                                        <div class="hr-text hr-text-left pt-4">Change Password</div>
                                        <hr>

                                        <!-- Password -->
                                        <div class="mb-2">
                                            <div class="input">
                                                <div class="form-outline position-relative">
                                                    <input type="password"
                                                        class="form-control @error('new_password') is-invalid @enderror ps-5"
                                                        id="new_password" name="new_password"
                                                        value="{{ old('new_password') }}" autocomplete="new-password"
                                                        placeholder="New Password">
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
                                                        class="form-control @error('new_password_confirmation') is-invalid @enderror ps-5"
                                                        placeholder="Confirm New Password"
                                                        name="new_password_confirmation" autocomplete="new-password">
                                                    <i class="fas fa-lock ms-3"></i>
                                                </div>
                                            </div>

                                            @error('new_password_confirmation')
                                            <span class="text-danger ms-1">
                                                <small>{{ $message }}</small>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row align-items-center">
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
<style>

.image-wrapper {
    position: relative;
    display: inline-block;
    width: 70px;
    height: 70px;
}

.avatar-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s;
    border-radius: 50%;
}



.remove-avatar-btn {
    position: absolute;
    top: 5px;
    right: 5px;
    width: 24px;
    height: 24px;
    background-color: rgba(255, 77, 79, 0.9);
    border: none;
    border-radius: 50%;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: transform 0.2s, background-color 0.3s;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.remove-avatar-btn:hover {
    background-color: rgba(255, 77, 79, 1); 
    transform: scale(1.1);
}

</style>
<script>
function removeAvatar() {
    const avatarWrapper = document.querySelector('.image-wrapper');
    if (avatarWrapper) {
        avatarWrapper.classList.add('hidden');
        setTimeout(() => avatarWrapper.style.display = 'none', 300); // Attendre la fin de l'animation
    }
    document.getElementById('remove_avatar').value = 'true';
}


// Optionnel : Prévisualisation de l'avatar sélectionné
function previewImages(input) {
    const previewContainer = document.getElementById('singlePreviewContainer');
    previewContainer.innerHTML = ''; // Effacer les aperçus précédents

    if (input.files) {
        Array.from(input.files).forEach(file => {
            const reader = new FileReader();
            reader.onload = e => {
                const img = document.createElement('img');
                img.src = e.target.result;
                img.style.height = '70px';
                img.style.width = '70px';
                img.style.borderRadius = '50%';
                previewContainer.appendChild(img);
            };
            reader.readAsDataURL(file);
        });
    }
}
</script>
@endsection