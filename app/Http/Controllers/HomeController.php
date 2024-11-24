<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;
use Overtrue\LaravelLike\Traits\Likeable;
use App\Models\Admin\Blog\BlogComment;
use App\Models\Admin\Blog\Post;
use App\Models\Setting;
use App\Models\Item;
use App\Models\PageTitle;
use Alert;
use App\Models\Comment;
use App\Models\PageImage;
use App\Models\User;
use Carbon\Carbon;

class HomeController extends Controller
{

    use Likeable;

    public $num_of_results;

    public function __construct()
    {
        $this->num_of_results = Setting::find('num_of_results')->value;
    }

    public function index()
    {
        $today = Carbon::today();

        $anniversaries = Item::whereHas('category', function ($q) {
            $q->where('status', 1);
        })
            ->where('status', 1)
            ->whereHas('details', function ($q) use ($today) {
                $q->whereMonth('death_date', $today->month);
            })
            ->with('details')
            ->orderByDesc('id')
            ->paginate(7);

        $posts = Post::withCount("comments")
            ->with("category")
            ->whereHas('category', function ($q) {
                $q->where('status', 1);
            })
            ->where('status', 1)
            ->orderByDesc('id')
            ->paginate(3);

        $items = Item::whereHas('category', function ($q) {
            $q->where('status', 1);
        })->where('status', 1)
            ->orderByDesc('id')
            ->paginate(7);

        $itemsForJumbo = Item::whereHas('category', function ($q) {
            $q->where('status', 1);
        })->where('status', 1)
            ->inRandomOrder()
            ->take(3)
            ->get();

        $pageTitle = PageTitle::where('page_identifier', 'home')->first();

        $pageImage = PageImage::where('id', 5)->first();

        return view('frontend.home.index')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => Setting::find('app_description')->value,
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => Setting::find('app_tagline')->value,
            'items' => $items,
            'posts' => $posts,
            'anniversaries' => $anniversaries,
            'pageTitle' => $pageTitle,
            'jumboStatus' => Setting::find('jumbotron')->value,
            'itemsForJumbo' => $itemsForJumbo,
            'pageImage' => $pageImage,
        ]);
    }

    public function about()
    {

        return view('frontend.about.index')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => '',
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => __('app.about_title')
        ]);
    }

    public function terms()
    {

        return view('frontend.terms.index')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => '',
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => __('app.terms_title')
        ]);
    }

    public function search(Request $request)
    {

        $validation = $request->validate([
            'keywords' => 'required|string',
        ]);

        $pageImages = PageImage::all();

        $key = $request->keywords;

        if ($validation) {
            $items = Item::whereHas('category', function ($q) {
                $q->where('status', 1);
            })->where('status', 1)
                ->search($key)
                ->paginate(9);
        }


        $pageTitle = PageTitle::where('page_identifier', 'home')->first();

        return view('frontend.search.index')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => '',
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => __('app.you_searched_for', ['key' => $key]),
            'items' => $items,
            'key' => $key,
            'pageTitle' => $pageTitle,
            'pageImages' => $pageImages
        ]);
    }

    function save_condolence(Request $request, $item_id)
    {

        $item = Item::findOrFail($item_id);

        if (Auth::user()->hasLiked($item)) {

            Auth::user()->unlike($item);

            return back();
        } else {

            $like = Auth::user()->like($item);

            return back();
        }
    }
}
