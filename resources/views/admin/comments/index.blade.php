@extends('admin.layouts.app')
@section('content')
    <div class="container-xl">
        <!-- Page title -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-title text-muted">
                        {{ __('Comments') }}
                    </div>
                    <span class="card-subtitle">
                        {{ __('Take control of your web application.') }}
                    </span>
                </div>
                <!-- Page title actions -->
                <div class="col-auto ms-auto d-print-none">
                    <div class="btn-list">

                        {{-- <a href="#" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#successMessageModal">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M12 8v4m0 4h.01"></path>
                                <path d="M3 3h18v18H3z"></path>
                            </svg>
                            {{ __('Comment Message') }}
                        </a> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
            <div class="card table-responsive">
                <div class="card-header">
                    <h2 class="card-title">
                        {{ __('Comments') }}
                    </h2>
                </div>

                <table class="table card-table table-vcenter">
                    <thead>
                        <tr>
                            <th class="w-1">{{ __('ID') }}</th>
                            <th>{{ __('Content') }}</th>
                            <th>{{ __('Posted by') }}</th>
                            <th>{{ __('Item') }}</th>
                            <th>{{ __('Created') }}</th>
                            <th>{{ __('Status') }}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($comments as $comment)
                            <tr>
                                <td class="text-muted">
                                    {{ $comment->id }}
                                </td>
                                <td>
                                    <em class="text-muted">
                                        {{ Str::limit($comment->content, 55, '...') }}
                                    </em>
                                </td>
                                <td>
                                    <a href="{{ route('admin.user.edit', $comment->user->id) }}" class="font-weight-bold"
                                        target="_blank">
                                        {{ $comment->user->name }}
                                    </a>
                                </td>
                                <td>
                                    <a href="{{ route('admin.obituary.edit', $comment->item->id) }}"
                                        class="font-weight-bold" target="_blank">
                                        {{ $comment->item->title }}
                                    </a>
                                </td>

                                <td>
                                    {{ $comment->created_at->format('d/m/Y - H:i:s') }}
                                </td>

                                <td>
                                    <a href="javascript:void(0);"
                                        onclick="updateStatusPost({{ $comment->id }}, 'comment')"
                                        class="text-decoration-none" id="status-post-{{ $comment->id }}">
                                        <span id="status-post-{{ $comment->id }}">
                                            @if ($comment->getStatus())
                                                <span class="badge bg-green-lt">{{ __('active') }}</span>
                                            @else
                                                <span class="badge bg-red-lt">{{ __('Disabled') }}</span>
                                            @endif
                                        </span>
                                    </a>
                                </td>

                                <td class="text-end">
                                    <span class="dropdown">
                                        <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport"
                                            data-bs-toggle="dropdown">Actions</button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item"
                                                href="{{ route('admin.comment.edit', $comment->id) }}">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24"
                                                    height="24" viewBox="0 0 24 24" stroke-width="2"
                                                    stroke="currentColor" fill="none" stroke-linecap="round"
                                                    stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                                    <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                                    <line x1="16" y1="5" x2="19" y2="8" />
                                                </svg>
                                                {{ __('Edit') }}
                                            </a>
                                            <a href="{{ route('admin.comment.destroy', $comment->id) }}"
                                                onclick="return confirm('Are you sure?')" class="dropdown-item">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon text-red me-2"
                                                    width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
                                                    stroke="currentColor" fill="none" stroke-linecap="round"
                                                    stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <line x1="4" y1="7" x2="20" y2="7" />
                                                    <line x1="10" y1="11" x2="10" y2="17" />
                                                    <line x1="14" y1="11" x2="14" y2="17" />
                                                    <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                                    <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                                                </svg>
                                                {{ __('Delete') }}
                                            </a>
                                        </div>
                                    </span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            {{ $comments->links() }}

        </div>
    </div>


    <div class="modal fade" id="successMessageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="{{ route('admin.comment_message.update') }}" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Comment Message</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="message" class="form-label">Success Message</label>
                            <textarea class="form-control" id="message" name="message" rows="3">{{ $message->message }}</textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
