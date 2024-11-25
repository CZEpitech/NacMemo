<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;
use App\Models\Item;
use App\Models\Category;
use App\Models\PageImage;
use App\Models\PageTitle;

class CategoryController extends Controller
{

    public $num_of_results;

    public function __construct()
    {
        $this->num_of_results = Setting::find('num_of_results')->value;
    }

    public function index($id, $slug, Request $request)
    {

        $category = Category::find($id);


        $items = Item::query()
            ->where('category_id', $id)
            ->where('status', 1)
            ->latest()
            ->paginate($this->num_of_results);

        $cat = Category::findOrFail($id);
        $pageImages = PageImage::all();

        $pageTitle = PageTitle::where('page_identifier', 'memorial')->first();

        return view('frontend.memorial.index')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => '',
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => $cat->name,
            'items' => $items,
            'cat' => $cat,
            'pageTitle' => $category->name,
            'pageSubTitle' => $category->description,
            'pageImages' => $pageImages
        ]);
    }
}
