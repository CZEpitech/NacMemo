@extends('admin.layouts.app')
@section('content')
    <div class="container-xl">
        <!-- Page title -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-title text-muted">
                        {{ __('Edit') }} - ({{ $item->title }})
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
            <div class="row">
                <div class="col">
                    <form action="{{ route('admin.obituary.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <!-- Form -->
                        <div class="card card-md rounded-3 shadow">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <!-- Title -->
                                        <div class="mb-3">
                                            <label class="form-label required">{{ __('app.title') }}</label>
                                            <input type="text" class="form-control @error('title') is-invalid @enderror"
                                                name="title" placeholder="{{ __('app.placeholder_title') }}"
                                                value="{{ !empty(old('title')) ? old('title') : $item->title }}">

                                            @error('title')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror

                                        </div>
                                        <!-- Description -->
                                        <div class="mb-3">
                                            <label class="form-label required">{{ __('app.description') }}</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="editor" name="description"
                                                rows="15">{{ !empty(old('description')) ? old('description') : $item->description }}</textarea>
                                            <small class="form-hint">{{ __('app.form_hint_textarea_insert') }}</small>

                                            @error('description')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror

                                        </div>
                                        <!-- Categoria -->
                                        <div class="mb-3">
                                            <div class="form-label required">{{ __('app.category') }}</div>
                                            <select class="form-select form-control @error('category') is-invalid @enderror"
                                                name="category">
                                                <option value="">{{ __('app.select_category') }}</option>
                                                @foreach ($categories as $cat)
                                                    <option value="{{ $cat->id }}"
                                                        @if (old('category', $item->category_id) == $cat->id) {{ 'selected' }} @endif>
                                                        {{ $cat->name }}</option>
                                                @endforeach
                                            </select>

                                            @error('category')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror

                                        </div>


                                        <!-- Upload images -->
                                        <div class="mb-3">
                                            <label class="form-label required">{{ __('app.photo') }}</label>

                                            <div class="mb-4">
                                                <div class="d-flex gap-2">
                                                    <div class="memorial-admin-image-box">
                                                        <img src="{{ asset($item->getThumb()) }}" alt="">
                                                        <div class="memorial-admin-image-overlay">
                                                            @if ($item->thumb)
                                                                <a href="{{ route('admin.delete.cover.image', $item->thumb) }}"
                                                                    class="btn btn-danger btn-sm">
                                                                    <i class="fas fa-trash"></i>
                                                                </a>
                                                            @endif

                                                        </div>
                                                    </div>

                                                    @foreach ($item->additionalImages as $image)
                                                        <div class="memorial-admin-image-box">
                                                            <img
                                                                src="{{ asset('img/obituary/' . $item->id . '/additional/' . $image->filename) }}">
                                                            <div class="memorial-admin-image-overlay">
                                                                <a href="{{ route('admin.delete.aditional.image', $image->id) }}"
                                                                    class="btn btn-danger btn-sm">
                                                                    <i class="fas fa-trash"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <div class="form-label required">{{ __('Status') }}</div>

                                            <label class="form-check form-switch mt-2">
                                                <input type="hidden" name="status" value="0">
                                                <input class="form-check-input @error('status') is-invalid @enderror"
                                                    type="checkbox" value="1" name="status"
                                                    {{ old('status', $item->status) == '1' ? 'checked="checked"' : '' }}>
                                            </label>

                                            @error('status')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror

                                        </div>

                                    </div>


                                    <div class="col-lg-6">
                                        <label class="form-label">{{ __('app.details') }}</label>
                                        <fieldset class="form-fieldset">
                                            <div class="row">

                                                <div class="mb-3">
                                                    <label class="form-label required">{{ __('app.sex') }}</label>

                                                    <select
                                                        class="form-select form-control @error('sex') is-invalid @enderror"
                                                        name="sex">
                                                        <option value="">{{ __('app.select_sex') }}</option>
                                                        <option value="male"
                                                            @if (old('sex', $item->details->sex) == 'male') selected @endif>
                                                            {{ __('app.male') }}</option>
                                                        <option value="female"
                                                            @if (old('sex', $item->details->sex) == 'female') selected @endif>
                                                            {{ __('app.female') }}</option>
                                                    </select>

                                                    @error('sex')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror

                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label required">{{ __('app.birth_date') }}</label>
                                                    <input type="date" name="birth_date"
                                                        class="form-control @error('birth_date') is-invalid @enderror"
                                                        placeholder="Select a date"
                                                        value="{{ !empty(old('birth_date')) ? old('birth_date') : $item->details->birth_date }}">

                                                    @error('birth_date')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror

                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label required">{{ __('app.death_date') }}</label>
                                                    <input type="date" name="death_date"
                                                        class="form-control @error('death_date') is-invalid @enderror"
                                                        placeholder="Select a date"
                                                        value="{{ !empty(old('death_date')) ? old('death_date') : $item->details->death_date }}">

                                                    @error('death_date')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror

                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">{{ __('app.funeral_place') }}</label>
                                                    <input type="text" name="funeral_place"
                                                        class="form-control @error('funeral_place') is-invalid @enderror"
                                                        placeholder="{{ __('app.placeholder_funeral_place') }}"
                                                        value="{{ !empty(old('funeral_place')) ? old('funeral_place') : $item->details->funeral_place }}">

                                                    @error('funeral_place')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror

                                                </div>

                                            </div>
                                        </fieldset>

                                    </div>


                                </div>
                            </div>

                            <div class="card-footer text-end">
                                <div class="d-flex">
                                    <input type="hidden" name="id" value="{{ $item->id }}">
                                    <a href="#" class="btn btn-link">{{ __('app.cancel') }}</a>
                                    <button type="submit" class="btn btn-blue ms-auto">{{ __('app.submit') }}</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
