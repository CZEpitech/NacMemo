@extends('admin.layouts.app')
@section('content')

<div class="container-xl">
    <div class="page-header d-print-none">
        <div class="row align-items-center">
            <div class="col">
                <div class="page-title text-muted">
                    {{__('Edit Category')}}
                </div>
                <span class="card-subtitle">
                    {{__('Take control of your web application.')}}
                </span>
            </div>
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
                <form action="{{ route('admin.blog.categories.update', $category->id) }}" method="POST">
                    @csrf
                    <div class="card card-md rounded-3 shadow">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label required">{{__('Name')}}</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" placeholder="{{__('Name')}}" value="{{ old('name', $category->name) }}">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label required">{{__('Description')}}</label>
                                        <div id="editor-container" style="border: 1px solid #ced4da; border-radius: 6px; height: 300px;"></div>
                                        <textarea class="form-control @error('description') is-invalid @enderror" 
                                            id="editor" 
                                            name="description" 
                                            hidden>{{ old('description', $category->description) }}</textarea>
                                        @error('description')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <div class="form-label required">{{__('Status')}}</div>
                                        <label class="form-check form-switch mt-2">
                                            <input type="hidden" name="status" value="0">
                                            <input class="form-check-input @error('status') is-invalid @enderror" type="checkbox" value="1" name="status" {{ old('status', $category->status) == '1' ? 'checked="checked"' : '' }}>
                                        </label>
                                        @error('status')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-end">
                            <div class="d-flex">
                                <input type="hidden" name="id" value="{{ $category->id }}">
                                <a href="{{ route('admin.categories') }}" class="btn btn-link">{{__('app.cancel')}}</a>
                                <button type="submit" class="btn btn-blue ms-auto">{{__('app.update')}}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Quill.js Integration -->
<link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var quill = new Quill('#editor-container', {
            theme: 'snow',
            placeholder: '{{ __("Type your description here...") }}',
            modules: {
                toolbar: [
                    [{ header: [1, 2, false] }],
                    ['bold', 'italic', 'underline'],
                    ['link', 'blockquote', 'code-block', 'image'],
                    [{ list: 'ordered' }, { list: 'bullet' }]
                ]
            }
        });

        var textarea = document.getElementById('editor');
        quill.root.innerHTML = textarea.value;

        var form = document.querySelector('form');
        form.onsubmit = function () {
            textarea.value = quill.root.innerHTML;
        };
    });
</script>

@endsection
