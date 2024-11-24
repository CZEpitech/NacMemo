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
                        <p>Edit your personal details</p>

                        <nav class="nav flex-column">
                            <a class="nav-link" href="{{ route('account') }}"><i class="fas fa-cog"></i> Setting</a>
                            <a class="nav-link active" href="{{ route('my-memorial') }}"><i
                                    class="fas fa-newspaper"></i> My Memorial</a>
                            <a class="nav-link" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </nav>
                    </div>
                </div>

                <div class="col-md-8">
                    <form id="obituaryForm" action="{{ route('update-memorial', $item->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf

                        <input type="hidden" name="delete_cover_image" id="delete_cover_image" value="0">
                        <input type="hidden" name="new_order" id="new_order" value="[]">

                        <div class="card shadow-sm p-3" style="border-radius: 32px">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="mb-2">
                                                    <p class="form-label d-block">Cover Photo</p>
                                                    <label class="form-control text-muted d-flex align-items-center"
                                                        for="customSingleFile"
                                                        style="cursor: pointer; border-radius: 12px; border: 1px solid #FBA8B2; padding-block: 12px;"
                                                        id="singleFileLabel">
                                                        <i class="fas fa-upload me-3" style="color: #FBA8B2;"></i>
                                                        <small id="singleFileCount"
                                                            style="margin-left: auto; color: #FBA8B2;">Update
                                                            here</small>
                                                    </label>
                                                    <input type="file" id="customSingleFile" name="image"
                                                        class="form-control d-none" accept="image/x-png,image/jpeg"
                                                        onchange="previewSingleImage(this)">
                                                    <div id="singlePreviewContainer"
                                                        style="display: flex; gap: 6px; margin-top: 10px; flex-wrap: wrap;">
                                                        <div class="image-preview">
                                                            <img src="{{ asset($item->getThumb()) }}"
                                                                style="width: 40px; height: 40px; object-fit: cover; object-position: center; border-radius: 5px;">
                                                        </div>
                                                    </div>
                                                    @error('image')
                                                    <div class="text-danger mt-1">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="mb-2">
                                                    <p class="form-label d-block">More Photos <small
                                                            class="text-muted">(5 images max)</small></p>
                                                    <label class="form-control text-muted d-flex align-items-center"
                                                        for="customMultipleFile"
                                                        style="cursor: pointer; border-radius: 12px; border: 1px solid #FBA8B2; padding-block: 12px;"
                                                        id="multipleFileLabel">
                                                        <i class="fas fa-upload me-3" style="color: #FBA8B2;"></i>
                                                        <small id="multipleFileCount"
                                                            style="margin-left: auto; color: #FBA8B2;">Update
                                                            here</small>
                                                    </label>
                                                    <input type="file" multiple id="customMultipleFile"
                                                        name="additional_images[]" class="form-control d-none"
                                                        accept="image/x-png,image/jpeg"
                                                        onchange="handleMultipleFiles(this)" max="5">
                                                    <div id="previewContainer"
                                                        style="display: flex; gap: 6px; margin-top: 10px; flex-wrap: wrap;">
                                                        @foreach ($item->additionalImages as $image)
                                                        <div class="image-preview" data-id="{{ $image->id }}">
                                                            <img src="{{ asset('img/obituary/' . $item->id . '/additional/' . $image->filename) }}"
                                                                style="width: 40px; height: 40px; object-fit: cover; object-position: center; border-radius: 5px;">
                                                            <button type="button" class="remove-image"
                                                                onclick="removeExistingAdditionalImage('{{ $image->id }}')">×</button>
                                                            <input type="hidden" name="deleted_additional_images[]"
                                                                value="{{ $image->id }}">
                                                        </div>
                                                        @endforeach
                                                    </div>
                                                    @error('additional_images')
                                                    <div class="text-danger mt-1">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label required">{{ __('app.title') }}</label>
                                            <input type="text"
                                                class="form-control custom-file-input @error('title') is-invalid @enderror"
                                                name="title" placeholder="{{ __('app.placeholder_title') }}"
                                                value="{{ old('title', $item->title) }}">

                                            @error('title')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror

                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label required">{{ __('app.description') }}</label>
                                            <textarea
                                                class="form-control custom-file-input @error('description') is-invalid @enderror"
                                                id="editor" cols="5" name="description"
                                                rows="15">{{ old('description', strip_tags($item->description)) }}</textarea>
                                            <small class="form-hint">{{ __('app.form_hint_textarea_insert') }}</small>

                                            @error('description')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror

                                        </div>

                                        <div class="mb-3">
                                            <div class="form-label required">{{ __('app.category') }}</div>
                                            <select
                                                class="form-select custom-file-input form-control @error('category') is-invalid @enderror"
                                                name="category">
                                                <option value="">{{ __('app.select_category') }}</option>
                                                @foreach ($categories as $cat)
                                                <option value="{{ $cat->id }}" @if (old('category', $item->category_id)
                                                    == $cat->id) selected @endif>
                                                    {{ $cat->name }}</option>
                                                @endforeach
                                            </select>

                                            @error('category')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror

                                        </div>

                                    </div>

                                    <div class="col-lg-12">

                                        <div class="row">

                                            <div class="mb-3">
                                                <label class="form-label required">{{ __('app.sex') }}</label>

                                                <select
                                                    class="form-select form-control custom-file-input @error('sex') is-invalid @enderror"
                                                    name="sex">
                                                    <option value="">{{ __('app.select_sex') }}</option>
                                                    <option value="male" @if (old('sex', $item->details->sex) == 'male')
                                                        selected @endif>
                                                        {{ __('app.male') }}</option>
                                                    <option value="female" @if (old('sex', $item->details->sex) ==
                                                        'female') selected @endif>
                                                        {{ __('app.female') }}</option>
                                                </select>

                                                @error('sex')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror

                                            </div>

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label
                                                        class="form-label required">{{ __('app.birth_date') }}</label>
                                                    <input type="date" name="birth_date"
                                                        class="form-control custom-file-input @error('birth_date') is-invalid @enderror"
                                                        value="{{ old('birth_date', $item->details->birth_date) }}">

                                                    @error('birth_date')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                    @enderror

                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label
                                                        class="form-label required">{{ __('app.death_date') }}</label>
                                                    <input type="date" name="death_date"
                                                        class="form-control custom-file-input @error('death_date') is-invalid @enderror"
                                                        value="{{ old('death_date', $item->details->death_date) }}">

                                                    @error('death_date')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                    @enderror

                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">{{ __('app.funeral_place') }}</label>
                                                    <input type="text" name="funeral_place"
                                                        class="form-control custom-file-input @error('funeral_place') is-invalid @enderror"
                                                        placeholder="{{ __('app.placeholder_funeral_place') }}"
                                                        value="{{ old('funeral_place', $item->details->funeral_place) }}">

                                                    @error('funeral_place')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                    @enderror

                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2 pt-3">
                                    <div class="d-grid">
                                        <button type="submit" class="btn memorial-submit">Update</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
</section>

<style>
.image-preview {
    position: relative;
    display: inline-block;
}

.image-preview img {
    width: 60px;
    height: auto;
    border-radius: 8px;
}

.image-preview .remove-image {
    position: absolute;
    top: 0px;
    right: 2px;
    background: transparent;
    border: none;
    cursor: pointer;
    font-weight: bold;
    color: red;
}
</style>

<script>
let additionalFiles = [];

function generateUniqueId() {
    return '_' + Math.random().toString(36).substr(2, 9);
}

function previewSingleImage(input) {
    const container = document.getElementById('singlePreviewContainer');
    const countLabel = document.getElementById('singleFileCount');

    container.innerHTML = '';

    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            container.innerHTML = `
                <div class="image-preview">
                    <img src="${e.target.result}" alt="Cover Photo">
                </div>
            `;
            document.getElementById('delete_cover_image').value = '1';
            countLabel.textContent = '1 selected';
        }
        reader.readAsDataURL(input.files[0]);
    } else {
        container.innerHTML = `
            <div class="image-preview">
                <img src="{{ asset($item->getThumb()) }}"
                     style="width: 40px; height: 40px; object-fit: cover; object-position: center; border-radius: 5px;">
            </div>
        `;
        document.getElementById('delete_cover_image').value = '0';
        countLabel.textContent = '0 selected';
    }
}

function removeCoverImage() {
    const input = document.getElementById('customSingleFile');
    input.value = '';
    const container = document.getElementById('singlePreviewContainer');
    container.innerHTML = `
        <div class="image-preview">
            <img src="{{ asset($item->getThumb()) }}"
                 style="width: 40px; height: 40px; object-fit: cover; object-position: center; border-radius: 5px;">
        </div>
    `;
    const countLabel = document.getElementById('singleFileCount');
    countLabel.textContent = '0 selected';
    document.getElementById('delete_cover_image').value = '1';
}

function handleMultipleFiles(input) {
    const existingImages = document.querySelectorAll('#previewContainer .image-preview').length;
    const remainingSlots = 5 - existingImages - additionalFiles.length;
    const files = Array.from(input.files).slice(0, remainingSlots);
    files.forEach(file => {
        const id = generateUniqueId();
        additionalFiles.push({
            id,
            file
        });
    });
    updateMultipleFiles();
    input.value = '';
}

function updateMultipleFiles() {
    const container = document.getElementById('previewContainer');
    const countLabel = document.getElementById('multipleFileCount');
    const existingImagesCount = container.querySelectorAll('.image-preview').length;
    countLabel.textContent = `${existingImagesCount + additionalFiles.length} selected`;

    additionalFiles.forEach(item => {
        const reader = new FileReader();
        reader.onload = function(e) {
            const div = document.createElement('div');
            div.classList.add('image-preview');
            div.setAttribute('data-id', item.id);
            div.innerHTML = `
                <img src="${e.target.result}" alt="More Photo">
                <button type="button" class="remove-image" onclick="removeNewAdditionalImage('${item.id}')">×</button>
            `;
            container.appendChild(div);
        }
        reader.readAsDataURL(item.file);
    });
}

function removeExistingAdditionalImage(imageId) {
    const container = document.getElementById('previewContainer');
    const imagePreview = container.querySelector(`.image-preview[data-id="${imageId}"]`);
    if (imagePreview) {
        imagePreview.remove();
        const hiddenInput = document.querySelector(`input[name="deleted_additional_images[]"][value="${imageId}"]`);
        if (hiddenInput) {
            hiddenInput.remove();
        }
    }
    const countLabel = document.getElementById('multipleFileCount');
    const currentCount = container.querySelectorAll('.image-preview').length + additionalFiles.length;
    countLabel.textContent = `${currentCount} selected`;
}

function removeNewAdditionalImage(id) {
    additionalFiles = additionalFiles.filter(item => item.id !== id);
    const container = document.getElementById('previewContainer');
    const imagePreview = container.querySelector(`.image-preview[data-id="${id}"]`);
    if (imagePreview) {
        imagePreview.remove();
    }
    const countLabel = document.getElementById('multipleFileCount');
    const currentCount = container.querySelectorAll('.image-preview').length + additionalFiles.length;
    countLabel.textContent = `${currentCount} selected`;
}

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('obituaryForm');
    form.addEventListener('submit', function(e) {
        additionalFiles.forEach(item => {
            const input = document.createElement('input');
            input.type = 'file';
            input.name = 'new_additional_images[]';
            const dataTransfer = new DataTransfer();
            dataTransfer.items.add(item.file);
            input.files = dataTransfer.files;
            form.appendChild(input);
        });

        const newOrderInput = document.getElementById('new_order');
        const order = [];
        const previews = document.querySelectorAll('#previewContainer .image-preview');
        previews.forEach(preview => {
            order.push(preview.getAttribute('data-id'));
        });
        newOrderInput.value = JSON.stringify(order);
    });
});
</script>
@endsection