@extends('admin.layouts.app')
@section('content')
    <!-- Contact Messages -->
    <div class="container-xl">
        <!-- Page title -->
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="page-title text-muted">
                        {{ __('Contact Messages') }}
                    </div>
                    <span class="card-subtitle">
                        {{ __('Manage messages received from users.') }}
                    </span>
                </div>
                <!-- Page title actions -->
                <div class="col-auto ms-auto d-print-none">
                    <div class="btn-list">
                        {{-- Additional buttons, if needed --}}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">
                        {{ __('Messages') }}
                    </h2>
                </div>

                <table class="table card-table table-vcenter">
                    <thead>
                        <tr>
                            <th width="50px"><input type="checkbox" id="master"></th>
                            <th class="w-1">{{ __('ID') }}</th>
                            <th>{{ __('Name') }}</th>
                            <th>{{ __('Email') }}</th>
                            <th>{{ __('Subject') }}</th>
                            <th>{{ __('Created') }}</th>
                            <th>{{ __('Actions') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($messages as $key => $message)
                            <tr id="tr_{{ $message->id }}">
                                <td>
                                    <input type="checkbox" class="sub_chk" data-id="{{ $message->id }}">
                                </td>
                                <td class="text-muted">
                                    {{ $message->id }}
                                </td>
                                <td>
                                    <span class="text-muted font-weight-bold">
                                        {{ $message->name }}
                                    </span>
                                </td>
                                <td>
                                    <a href="mailto:{{ $message->email }}" class="font-weight-bold">
                                        {{ $message->email }}
                                    </a>
                                </td>
                                <td>
                                    <em class="text-muted font-weight-bold">
                                        {{ $message->subject }}
                                    </em>
                                </td>
                                <td>
                                    {{ $message->created_at->format('d/m/Y - H:i:s') }}
                                </td>
                                <td class="text-end">
                                    <span class="dropdown">
                                        <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport"
                                            data-bs-toggle="dropdown">Actions</button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item"
                                                href="{{ route('admin.message.show', $message->id) }}">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24"
                                                    height="24" viewBox="0 0 24 24" stroke-width="2"
                                                    stroke="currentColor" fill="none" stroke-linecap="round"
                                                    stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M5 12h14M12 5l7 7-7 7" />
                                                </svg>
                                                {{ __('View Message') }}
                                            </a>
                                            <a href="{{ route('admin.message.destroy', $message->id) }}"
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

            {{ $messages->links() }}

        </div>
    </div>
@endsection
