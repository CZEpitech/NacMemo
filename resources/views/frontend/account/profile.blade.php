@extends('frontend.master')

@section('content')
    <section id="profile">
        <div class="bg">
            <div class="container">

                <div class="row">

                    <div class="col-md-4">
                        <div class="card p-3">

                            <div class="d-flex align-items-center gap-2">

                                <div class="image">
                                    <img src="{{ asset($user->getAvatar()) }}" class="rounded" width="100" height="100">
                                </div>

                                <div class="ml-3 w-100">

                                    <h4 class="mb-0 mt-0">{{ $user->name }}</h4>

                                    <div
                                        class="p-2 mt-2 bg-primary d-flex justify-content-around  rounded text-white stats">

                                        <div class="d-flex flex-column">

                                            <span class="followers">Comments</span>
                                            <span class="number2">{{ $blogComments + $user->comments->count() }}</span>

                                        </div>


                                        <div class="d-flex flex-column">

                                            <span class="rating">Obituaries</span>
                                            <span class="number3">{{ $user->items->count() }}</span>

                                        </div>

                                    </div>

                                </div>


                            </div>

                        </div>
                    </div>

                </div>
                <hr>

                <div class="row pt-4">
                    <div class="col-md-12">
                        <h4 class="pb-3">Latest Posts of {{ $user->name }}</h4>
                    </div>
                    @forelse($user->items as $item)
                        <div class="col-md-4">
                            <div class="memorial-post-card">
                                <div class="card-image">
                                    <a href="{{ route('show.obituary', [$item->id, $item->slug]) }}" class="h-100 w-100">
                                        <img src="{{ asset($item->getThumb()) }}" class="img-fluid" alt="card-image1">
                                    </a>
                                </div>
                                <div class="card-text">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <h6 class="aminal-name mb-0">{{ Str::limit($item->title, 10) }}</h6>
                                        <p class="aminal-type mb-0">{{ $item->category->name }}</p>
                                    </div>

                                    <div class="date">
                                        <i class="fas fa-calendar-alt"></i>
                                        <span>
                                            {{ Carbon\Carbon::create($item->details->birth_date)->format('d M, Y') }}</span>
                                    </div>

                                    <div class="d-grid">
                                        <a href="{{ route('show.obituary', [$item->id, $item->slug]) }}"
                                            class="btn btn-primary" type="button">View Memorial</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @empty
                        <p>This user has no posts</p>
                    @endforelse




                </div>

                <div class="row pt-4">
                    <div class="col-md-12">
                        <div class="comment">

                            <div class="user-comment">
                                <h4>Latest Comment</h4>

                                <div class="comments">
                                    @forelse($user->comments->take(5) as $comment)
                                        <div class="comment-box">
                                            <div class="comment-user d-flex align-items-center ">
                                                <div class="author-image me-2">
                                                    <img src="{{ asset($comment->user->getAvatar()) }}" alt="user">
                                                </div>
                                                <div class="author">
                                                    <p class="m-0"> <a class="text-dark"
                                                            href="{{ route('profile', [$comment->user->id, $comment->user->name]) }}">
                                                            {{ $comment->user->name }}</a>
                                                        <span class="m-0">
                                                            {{ $comment->created_at->diffForHumans() }}</span>
                                                    </p>

                                                </div>
                                            </div>
                                            <div class="comment-message">
                                                <p> {{ $comment->content }}</p>
                                            </div>
                                        </div>
                                    @empty
                                        <p>This user has no comment</p>
                                    @endforelse

                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
