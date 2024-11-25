<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="description" content="{{ strip_tags($site_description) }}">

    <title>{{ strip_tags($page_name) }} - {{ $site_name }}</title>
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/frontend/images/favicon.ico') }}">

    <meta name="msapplication-TileColor" content="#206bc4" />
    <meta name="theme-color" content="#206bc4" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="HandheldFriendly" content="True" />
    <meta name="MobileOptimized" content="320" />

    <meta name="twitter:image:src" content="{{ $site_image }}">
    <meta name="twitter:site" content="">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="{{ strip_tags($page_name) }}">
    <meta name="twitter:description" content="{{ strip_tags($site_description) }}">
    <meta property="og:image" content="{{ $site_image }}">
    <meta property="og:image:width" content="1280">
    <meta property="og:image:height" content="640">
    <meta property="og:site_name" content="{{ $site_name }}">
    <meta property="og:type" content="object">
    <meta property="og:title" content="{{ strip_tags($page_name) }}">
    <meta property="og:url" content="{{ $site_image }}">
    <meta property="og:description" content="{{ strip_tags($site_description) }}">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/bootstrap.min.css') }}">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/fontawesome.css') }}">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/lib/lightbox/dist/css/lightbox.min.css') }}">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/slick.min.css') }}">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/slick-theme.min.css') }}">
    <!-- StyleSheet -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/style.css') }}">
    <!-- Responsive Sheet -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/responsive.css') }}">

    <style>
        #floating-alert {
            position: fixed;
            top: 100px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1050;
            width: 90%;
            max-width: 600px;
            background: white;
            border-radius: 30px;
            color: #252525;
        }

        .tox-statusbar {
            display: none !important;
        }

        .tox-tinymce {
            border: 1px solid #FBA8B2 !important;
            border-radius: 4px;
        }

        .tox .tox-edit-area::before {
            border: 1px solid transparent !important;
        }
    </style>
</head>



<body>


    <!-- ========================================
    TopBar-Section-Start
  =========================================== -->
    @include('frontend.layout.topbar')
    <!-- ========================================
    TopBar-Section-End
  =========================================== -->




    <!-- ========================================
    MobileNav-Section-Start
  =========================================== -->

    @include('frontend.layout.nav-mobile')


    <!-- ========================================
    MobileNav-Section-Start
  =========================================== -->



    <!-- ========================================
     Header-Section-Start
  =========================================== -->

    @include('frontend.layout.header')


    <!-- ========================================
     Header-Section-End
  =========================================== -->


    <!-- ========================================
     Hero-Section-Start
  =========================================== -->

    @include('frontend.layout.hero')

    <!-- ========================================
     Hero-Section-End
  =========================================== -->


    {{-- Content-Start --}}

    @yield('content')


    {{-- Content-End --}}




    <!-- ========================================
    Footer-Section-Start
  =========================================== -->

    @include('frontend.layout.footer')
    <!-- ========================================
    Footer-Section-End
  =========================================== -->




    <!--=====================================
        Script-Section-Start
  =======================================-->

<!-- Include Quill.js -->
<link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
<style>
    .ql-toolbar.ql-snow{
        border: 0px !important;
    }
    </style>
<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>

<!-- Include Quill Emoji Plugin -->
<link href="https://cdn.jsdelivr.net/npm/quill-emoji/dist/quill-emoji.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/quill-emoji/dist/quill-emoji.min.js"></script>

<script>
    // Initialize Quill Editor
    var quill = new Quill('#editor-container', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'header': [1, 2, false] }],
                ['bold', 'italic', 'underline'],
                ['emoji'], // Add emoji button to toolbar
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                ['clean'] // Clear formatting
            ],
            'emoji-toolbar': true,
            'emoji-textarea': false,
            'emoji-shortname': true
        }
    });

    // Sync Quill content to hidden textarea
    quill.on('text-change', function () {
        document.querySelector('#editor').value = quill.root.innerHTML;
    });
</script>

    <script src="{{ asset('assets/frontend/js/jquery-1.12.4.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/js/popper.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/js/bootstrap.bundle.min.js') }}"></script>

    <script src="{{ asset('assets/frontend/lib/lightbox/dist/js/lightbox.js') }}"></script>

    <script src="{{ asset('assets/frontend/js/slick.min.js') }}"></script>
    <script src="{{ asset('assets/frontend/js/script.js') }}"></script>
    {!! NoCaptcha::renderJs() !!}
    <script>
        $(document).ready(function() {
            $('#birth_date, #death_date').on('change', function() {
                const birthDate = $('#birth_date').val();
                const deathDate = $('#death_date').val();

                if (birthDate && deathDate) {
                    const birthDateObj = new Date(birthDate);
                    const deathDateObj = new Date(deathDate);

                    if (deathDateObj < birthDateObj) {
                        alert('Death date cannot be earlier than birth date.');
                        $('#death_date').val('');
                    }
                }
            });
        });

        $(document).on('click', '#loadMoreComments', function() {
            const button = $(this);
            const offset = button.data('offset');
            const url = '{{ route('comments.loadMore', $item->id ?? 0) }}';

            $.ajax({
                url: url,
                method: 'GET',
                data: {
                    offset: offset
                },
                success: function(response) {
                    $('#comments-container').append(response.comments);
                    button.data('offset', response.nextOffset);

                    // If no more comments to load, hide the button
                    if (!response.comments.trim()) {
                        button.hide();
                    }
                },
                error: function() {
                    alert('Error loading comments.');
                },
            });
        });
    </script>




    <script>
        function previewImages(input) {
            const isMultiple = input.id === 'customMultipleFile';
            const fileCountElement = isMultiple ? 'multipleFileCount' : 'singleFileCount';
            const previewContainer = isMultiple ? 'previewContainer' : 'singlePreviewContainer';

            const files = input.files;

            if (files.length > 5) {
                alert("You can only select up to 5 images.");
                input.value = '';
                return;
            }

            document.getElementById(fileCountElement).textContent = files.length + " selected";

            const previewContainerElement = document.getElementById(previewContainer);
            previewContainerElement.innerHTML = '';

            Array.from(files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.style.maxWidth = '60px';
                    img.style.borderRadius = '5px';
                    img.style.height = '45px';
                    img.style.objectFit = 'cover';
                    img.style.objectPosition = 'center';
                    previewContainerElement.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        }
    </script>

    <script>
        tinymce.init({
            selector: '#editor',
            plugins: 'emoticons',
            menubar: false,
            toolbar: 'styleselect | bold italic underline | emoticons ',
            emoticons: {
                'values': [{
                        title: 'Smile',
                        value: '😊'
                    },
                    {
                        title: 'Sad',
                        value: '😢'
                    },
                    {
                        title: 'Thumbs Up',
                        value: '👍'
                    },
                    {
                        title: 'Thumbs Down',
                        value: '👎'
                    },
                    {
                        title: 'Heart',
                        value: '❤️'
                    },
                    // Add more emojis as needed
                ]
            },
            setup: function(editor) {
                editor.ui.registry.addButton('emoticons', {
                    text: '😊',
                    tooltip: 'Insert Emoji',
                    onAction: function() {
                        editor.insertContent('😊');
                    }
                });
            }
        });
    </script>




    <!--=====================================
        Script-Section-End
  =======================================-->



</body>

</html>
