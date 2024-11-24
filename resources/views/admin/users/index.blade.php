@extends('admin.layouts.app')
@section('content')
    <!-- Latest obituaries -->
    <div class="container-xl">
        <!-- Page title -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-title text-muted">
                        {{ __('Users') }}
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
            <div class="card table-responsive">
                <div class="card-header">
                    <h2 class="card-title">
                        {{ __('Users') }}
                    </h2>
                </div>

                <table class="table card-table table-vcenter">
                    <thead>
                        <tr>
                            <th class="w-1">ID</th>
                            <th>Avatar</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Created</th>
                            <th>Verified</th>
                            <th>Provider</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($users as $user)
                            <tr>
                                <td class="text-muted">
                                    {{ $user->id }}
                                </td>
                                <td>
                                    <span class="avatar"
                                        style="background-image: url({{ asset($user->getAvatar()) }})"></span>
                                </td>
                                <td>
                                    <span class="text-muted font-weight-bold">
                                        {{ $user->name }}
                                    </span>
                                </td>
                                <td>
                                    <em class="text-muted">
                                        {{ $user->email }}
                                    </em>
                                </td>
                                <td>
                                    {{ $user->created_at->format('d/m/Y - H:i:s') }}
                                </td>

                                <td>
                                    @if ($user->hasEmailVerified())
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24"
                                            height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                            fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="12" cy="12" r="9" />
                                            <path d="M10 10l4 4m0 -4l-4 4" />
                                        </svg>
                                    @else
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon text-green" width="24"
                                            height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                            fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="12" cy="12" r="9" />
                                            <path d="M9 12l2 2l4 -4" />
                                        </svg>
                                    @endif

                                </td>

                                <td>
                                    <p class="text-muted">
                                        {{ $user->provider ?? 'E-mail' }}
                                    </p>
                                </td>

                                <td class="text-end">
                                    <span class="dropdown">
                                        <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport"
                                            data-bs-toggle="dropdown">Actions</button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="{{ route('admin.user.edit', $user->id) }}">
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
                                            @if ($user->getRoleNames() != collect(['admin']))
                                                <a class="dropdown-item"
                                                    href="{{ route('admin.user.destroy', $user->id) }}">
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
                                            @endif
                                        </div>
                                    </span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            {{ $users->links() }}

        </div>
    </div>
@endsection
