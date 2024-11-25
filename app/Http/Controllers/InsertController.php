<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Stevebauman\Purify\Facades\Purify;
use App\Models\Setting;
use App\Models\Item;
use App\Models\Image;
use App\Models\Detail;
use App\Models\PageTitle;
use Alert;
use App\Mail\MemorialPending;
use App\Models\ItemAdditionalImage;
use Flasher\Prime\FlasherInterface;
use Illuminate\Support\Facades\Mail;

class InsertController extends Controller
{

    public $new_entries;

    public function __construct()
    {
        $this->new_entries = Setting::find('new_entries')->value;
    }

    function make_slug($string)
    {
        $string = preg_replace('~[^\\pL\d]+~u', '-', trim($string));
        return Str::lower($string);
    }

    function isLoggedIn()
    {
        if (Auth::check()) {
            return Auth::id();
        }
    }

    public function index()
    {

        $pageTitle = PageTitle::where('page_identifier', 'add_memorial')->first();

        return view('frontend.memorial.add')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => __('app.sd_enter_an_obituary'),
            'site_image' => asset('img/logo/logo_big.jpg'),
            'page_name' => __('app.pn_enter_an_obituary'),
            'pageTitle' => $pageTitle
        ]);
    }

    public function store(Request $request, FlasherInterface $flasher)
    {

        $minLength = DB::table('settings')->where('name', 'description_min_length')->value('value');

        $validation = $request->validate([
            'title' => 'required',
            'description' => 'required|string|min:' . $minLength,
            'category' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'additional_images' => 'nullable|array|max:5',
            'additional_images.*' => 'nullable|image|mimes:jpeg,png,jpg|max:3072',
            'terms_of_service' => 'accepted',
            'sex' => 'required|in:male,female',
            'birth_date' => 'required|date',
            'death_date' => 'required|date',
            'funeral_place' => 'nullable|string|min:1|max:150',
        ]);

        $create = Item::create([
            'title' => ucwords($request->title),
            'description' => (Purify::clean($request->description)),
            'user_id' => $this->isLoggedIn(),
            'category_id' => $request->category,
            'slug' => $this->make_slug($request->title),
            'status' => $this->new_entries,
            'terms' => 1
        ]);

        if ($create) {
            Detail::create([
                'sex' => $request->sex,
                'birth_date' => $request->birth_date,
                'death_date' => $request->death_date,
                'funeral_place' => ucwords($request->funeral_place),
                'item_id' => $create->id,
            ]);
        }

        if ($request->hasfile('image')) {
            $file = $request->file('image');
            $name = Str::random(35) . '.' . $file->extension();
            $file->move(public_path('img/obituary/' . $create->id), $name);

            Image::create([
                'filename' => $name,
                'imageable_id' => $create->id,
                'imageable_type' => 'App\Models\Item'
            ]);
        }

        if ($request->hasfile('additional_images')) {
            foreach ($request->file('additional_images') as $additionalImage) {
                $additionalImageName = Str::random(35) . '.' . $additionalImage->extension();
                $additionalImage->move(public_path('img/obituary/' . $create->id . '/additional'), $additionalImageName);

                ItemAdditionalImage::create([
                    'item_id' => $create->id,
                    'filename' => $additionalImageName,
                ]);
            }
        }

        if ($create) {
            if (Setting::find('new_entries')->value == 1) {
                $message = __('app.success_message_subtitle_1');
            } else {
                $message = __('app.success_message_subtitle_0');
            }

            Mail::to($create->user->email)->send(new MemorialPending($create));

            $successMessage = DB::table('success_messages')
                ->where('key', 'memorial_post_success')
                ->value('message');

            $flasher->addInfo($successMessage, 'Success!', [
                'position' => 'top-center',
                'timer' => 5000,
                'icon' => 'check-circle'
            ]);


            return redirect()->route('index');
        } else {
            $flasher->addError(__('app.error_message'), 'Error!', [
                'position' => 'top-center',
                'timer' => 5000,
                'icon' => 'check-circle'
            ]);
            return back();
        }
    }


    public function update(Request $request, $id, FlasherInterface $flasher)
{
    $validation = $request->validate([
        'title' => 'required',
        'description' => 'required|string|min:150',
        'category' => 'required|exists:categories,id',
        'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        'additional_images' => 'nullable|array|max:5',
        'additional_images.*' => 'nullable|image|mimes:jpeg,png,jpg',
        'deleted_additional_images' => 'nullable|array',
        'deleted_additional_images.*' => 'nullable|exists:item_additional_images,id',
        'sex' => 'required|in:male,female',
        'birth_date' => 'required|date',
        'death_date' => 'required|date|after_or_equal:birth_date',
        'funeral_place' => 'nullable|string|min:1|max:150',
    ]);

    $item = Item::findOrFail($id);

    // Mise à jour des champs principaux
    $item->update([
        'title' => $request->title,
        'description' => Purify::clean($request->description),
        'category_id' => $request->category,
        'slug' => $this->make_slug($request->title),
        'status' => $this->new_entries,
        'terms' => 1
    ]);

    // Mise à jour ou création des détails
    $item->details()->updateOrCreate(
        ['item_id' => $item->id],
        [
            'sex' => $request->sex,
            'birth_date' => $request->birth_date,
            'death_date' => $request->death_date,
            'funeral_place' => $request->funeral_place,
        ]
    );

    // Mise à jour de la photo principale si un nouveau fichier est téléchargé
    if ($request->hasFile('image')) {
        $oldImage = $item->thumb;

        if ($oldImage) {
            $oldFilePath = public_path('img/obituary/' . $item->id . '/' . $oldImage->filename);
            if (file_exists($oldFilePath)) {
                unlink($oldFilePath);
            }
            $oldImage->delete();
        }

        $file = $request->file('image');
        $name = Str::random(35) . '.' . $file->extension();
        $file->move(public_path('img/obituary/' . $item->id), $name);

        $item->thumb()->create([
            'filename' => $name,
            'imageable_id' => $item->id,
            'imageable_type' => 'App\Models\Item'
        ]);
    }

    // Suppression des images secondaires sélectionnées
    if ($request->has('deleted_additional_images')) {
        foreach ($request->deleted_additional_images as $imageId) {
            $image = ItemAdditionalImage::find($imageId);
            if ($image && $image->item_id == $item->id) {
                $filePath = public_path('img/obituary/' . $item->id . '/additional/' . $image->filename);
                if (file_exists($filePath)) {
                    unlink($filePath);
                }
                $image->delete();
            }
        }
    }

    // Ajout de nouvelles images secondaires
    if ($request->hasFile('additional_images')) {
        $existingAdditionalImagesCount = ItemAdditionalImage::where('item_id', $item->id)->count();
        $newImagesCount = count($request->file('additional_images'));
        $allowedImages = 5 - $existingAdditionalImagesCount;

        if ($newImagesCount > $allowedImages) {
            return back()->withErrors(['additional_images' => 'Vous ne pouvez ajouter que ' . $allowedImages . ' image(s) supplémentaire(s).'])->withInput();
        }

        foreach ($request->file('additional_images') as $additionalImage) {
            $additionalImageName = Str::random(35) . '.' . $additionalImage->extension();
            $additionalImage->move(public_path('img/obituary/' . $item->id . '/additional'), $additionalImageName);

            ItemAdditionalImage::create([
                'item_id' => $item->id,
                'filename' => $additionalImageName,
            ]);
        }
    }

    // Gestion de l'ordre des images si nécessaire
    // if ($request->new_order) {
    //     $order = json_decode($request->new_order, true);
    //     foreach ($order as $index => $imageId) {
    //         $image = ItemAdditionalImage::find($imageId);
    //         if ($image && $image->item_id == $item->id) {
    //             $image->order = $index;
    //             $image->save();
    //         }
    //     }
    // }

    // Messages de succès ou d'erreur
    if ($item) {
        $successMessage = DB::table('success_messages')
            ->where('key', 'memorial_post_updated')
            ->value('message');

        $flasher->addInfo($successMessage, 'Updated!', [
            'position' => 'top-center',
            'timer' => 5000,
            'icon' => 'check-circle'
        ]);

        return redirect()->route('my-memorial');
    } else {
        $flasher->addError(__('app.error_message'), 'Error!', [
            'position' => 'top-center',
            'timer' => 5000,
            'icon' => 'check-circle'
        ]);
        return back();
    }
}

}
