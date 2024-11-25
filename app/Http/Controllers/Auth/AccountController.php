<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Overtrue\LaravelLike\Traits\Likeable;
use App\Models\User;
use App\Models\Item;
use App\Models\Comment;
use App\Models\Setting;
use App\Models\PageTitle;
use App\Models\Admin\Blog\BlogComment;
use Flasher\Prime\FlasherInterface;
use Illuminate\Support\Facades\DB;

class AccountController extends Controller
{
    use Likeable;

    public function index()
    {
        $pageTitle = PageTitle::where('page_identifier', 'account')->first();

        return view('frontend.account.setting')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => __('app.update_your_account_desc'),
            'site_image' => Auth::user()->avatar 
                ? asset('img/avatar/' . Auth::id() . '/' . Auth::user()->avatar)
                : asset('img/default-avatar.png'), // Fournir un avatar par défaut si aucun n'existe
            'page_name' => __('app.update_your_account'),
            'pageTitle' => $pageTitle
        ]);
    }

    public function store(Request $request, FlasherInterface $flasher)
    {
        // Valider les champs, y compris 'remove_avatar'
        $validation = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email:rfc,dns|unique:users,email,' . Auth::id(),
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'remove_avatar' => 'required|in:true,false',
            'new_password' => 'nullable|string|min:8|confirmed',
            'notification_comment' => 'nullable|boolean',
        ]);

        $user = Auth::user();

        // Vérifier si le bouton de renvoi de vérification a été cliqué
        if ($request->has('resend_verification') && !$user->hasVerifiedEmail()) {
            $user->sendEmailVerificationNotification();

            $successMessage = DB::table('success_messages')
                ->where('key', 'verification_sent_success')
                ->value('message');

            $flasher->addInfo($successMessage, 'Success!', [
                'position' => 'top-center',
                'timer' => 5000,
                'icon' => 'check-circle'
            ]);

            return redirect()->back();
        }

        // Gérer la suppression de l'avatar
        if ($request->input('remove_avatar') === 'true') {
            if ($user->avatar) {
                $avatarPath = public_path('img/avatar/' . $user->id . '/' . $user->avatar);
                if (File::exists($avatarPath)) {
                    File::delete($avatarPath);
                }
                $user->avatar = null;
            }
        }

        // Gérer l'upload de l'avatar
        if ($request->hasFile('avatar')) {
            // Supprimer l'ancien avatar s'il existe
            if ($user->avatar) {
                $oldAvatarPath = public_path('img/avatar/' . $user->id . '/' . $user->avatar);
                if (File::exists($oldAvatarPath)) {
                    File::delete($oldAvatarPath);
                }
            }

            $file = $request->file('avatar');
            $name = Str::random(35) . '.' . $file->extension();
            $file->move(public_path('img/avatar/' . $user->id), $name);

            // Mettre à jour l'avatar dans la base de données
            $user->avatar = $name;
        }

        // Mettre à jour le nom et l'email
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->notification_comment = $request->has('notification_comment') ? $request->input('notification_comment') : false;

        // Gérer le changement de mot de passe si fourni
        if ($request->filled('new_password')) {
            $user->password = bcrypt($request->input('new_password'));
        }

        // Sauvegarder les modifications
        $updated = $user->save();

        if ($updated) {
            $flasher->addSuccess(__('app.you_have_updated_your_account'), [
                'position' => 'top-center',
                'timer' => 5000,
                'icon' => 'check-circle'
            ]);

            return back();
        } else {
            $flasher->addError(__('app.error_message'), [
                'position' => 'top-center',
                'timer' => 5000,
                'icon' => 'check-circle'
            ]);
            return back();
        }
    }

    public function profile($id, $name)
    {
        $pageTitle = PageTitle::where('page_identifier', 'profile')->first();

        $user = User::findOrFail($id);

        $blogComments = BlogComment::where('commented_by', $id)
            ->where('status', 1)
            ->count();

        return view('frontend.account.profile')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => __('app.sd_the_profile_of'),
            'site_image' => $user->avatar 
                ? asset('img/avatar/' . $user->id . '/' . $user->avatar)
                : asset('img/default-avatar.png'), // Fournir un avatar par défaut si aucun n'existe
            'page_name' => __('app.pn_the_profile_of', ['name' => $user->name]),
            'user' => $user,
            'blogComments' => $blogComments,
            'pageTitle' => $pageTitle
        ]);
    }

    public function my_memorial()
    {
        $user = Auth::user();

        $items = Item::where('user_id', $user->id)->latest()->paginate(10);

        return view('frontend.account.my-memorial')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => __('app.sd_the_profile_of'),
            'site_image' => $user->avatar 
                ? asset('img/avatar/' . $user->id . '/' . $user->avatar)
                : asset('img/default-avatar.png'), // Fournir un avatar par défaut si aucun n'existe
            'page_name' => __('app.pn_the_profile_of', ['name' => $user->name]),
            'user' => $user,
            'items' => $items,
        ]);
    }

    public function edit_memorial(Item $item)
    {
        $user = Auth::user();

        return view('frontend.account.edit-memorial')->with([
            'site_name' => Setting::find('app_name')->value,
            'site_description' => __('app.sd_the_profile_of'),
            'site_image' => $user->avatar 
                ? asset('img/avatar/' . $user->id . '/' . $user->avatar)
                : asset('img/default-avatar.png'), // Fournir un avatar par défaut si aucun n'existe
            'page_name' => __('app.pn_the_profile_of', ['name' => $user->name]),
            'user' => $user,
            'item' => $item,
        ]);
    }
}