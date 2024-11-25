<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use App\Models\Admin\Blog\BlogComment;
use App\Http\Controllers\Admin\Blog\PostController;
use App\Http\Controllers\Admin\SocialLinkController;
use App\Http\Controllers\Admin\MessageController;
use App\Http\Controllers\Admin\PageTitleController;
use App\Http\Controllers\Admin\Blog\BlogCommentController;
use App\Http\Controllers\Admin\Blog\BlogCategoryController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['middleware' => ['role:admin']], function () {

    // Dashboard
    Route::get('/admin', [AdminController::class, 'index'])->name('admin.dashboard');

    // Settings
    Route::get('/admin/settings', [AdminController::class, 'edit'])->name('admin.settings');
    Route::post('/admin/settings', [AdminController::class, 'update'])->name('admin.settings.update');
    Route::get('/admin/settings/about', [AdminController::class, 'about'])->name('admin.about');
    Route::post('/admin/settings/about', [AdminController::class, 'about_update'])->name('admin.about.update');
    Route::get('/admin/settings/terms', [AdminController::class, 'terms'])->name('admin.terms');
    Route::post('/admin/settings/terms', [AdminController::class, 'terms_update'])->name('admin.terms.update');
    Route::get('/admin/settings/logos', [AdminController::class, 'logos'])->name('admin.logos');
    Route::post('/admin/settings/logos', [AdminController::class, 'logos_update'])->name('admin.logos.update');

    // Users
    Route::get('/admin/users', [AdminController::class, 'users'])->name('admin.users');
    Route::get('/admin/users/{id}', [AdminController::class, 'user_edit'])->name('admin.user.edit');
    Route::post('/admin/users/{id}', [AdminController::class, 'user_update'])->name('admin.user.update');
    Route::get('/admin/users/destroy/{id}', [AdminController::class, 'user_destroy'])->name('admin.user.destroy');

    // Obituaries
    Route::get('/admin/obituaries', [AdminController::class, 'obituaries'])->name('admin.obituaries');
    // Route::get('/admin/obituary/create', [AdminController::class, 'obituary_create'])->name('admin.obituary.create');
    // Route::post('/admin/obituary/create', [AdminController::class, 'obituary_store'])->name('admin.obituary.store');
    Route::get('/admin/obituary/edit/{id}', [AdminController::class, 'obituary_edit'])->name('admin.obituary.edit');
    Route::post('/admin/obituary/edit', [AdminController::class, 'obituary_update'])->name('admin.obituary.update');
    Route::get('/admin/obituaries/delete/{id}', [AdminController::class, 'obituary_destroy'])->name('admin.obituary.destroy');
    Route::post('/admin/obituaries/delete-all', [AdminController::class, 'obituary_delete_all'])->name('admin.obituary.destroyall');
    Route::get('/admin/obituary/download/{id}', [AdminController::class, 'downloadPDF'])->name('admin.obituary.download');

    Route::post('admin/obituaries_message/update', [AdminController::class, 'obituaries_message'])->name('admin.obituaries_message.update');
    Route::post('admin/comment_message/update', [AdminController::class, 'comment_message'])->name('admin.comment_message.update');


    Route::get('admin/delete/aditional/image/{id}', [AdminController::class, 'delete_aditional_image'])->name('admin.delete.aditional.image');
    Route::get('admin/delete/cover/image/{image}', [AdminController::class, 'delete_cover_image'])->name('admin.delete.cover.image');

    // Categories
    Route::get('/admin/categories', [AdminController::class, 'categories'])->name('admin.categories');
    Route::get('/admin/categories/create', [AdminController::class, 'category_create'])->name('admin.category.create');
    Route::post('/admin/categories/create', [AdminController::class, 'category_store'])->name('admin.category.store');
    Route::get('/admin/categories/edit/{id}', [AdminController::class, 'category_edit'])->name('admin.category.edit');
    Route::post('/admin/categories/edit', [AdminController::class, 'category_update'])->name('admin.category.update');
    Route::get('/admin/categories/delete/{id}', [AdminController::class, 'category_destroy'])->name('admin.category.destroy');

    // Comments
    Route::get('/admin/comments', [AdminController::class, 'comments'])->name('admin.comments');
    Route::get('/admin/comments/edit/{id}', [AdminController::class, 'comment_edit'])->name('admin.comment.edit');
    Route::post('/admin/comments/edit', [AdminController::class, 'comment_update'])->name('admin.comment.update');
    Route::get('/admin/comments/delete/{id}', [AdminController::class, 'comment_destroy'])->name('admin.comment.destroy');

    // Pages
    Route::get('/admin/pages', [AdminController::class, 'pages'])->name('admin.pages');
    Route::get('/admin/pages/create', [AdminController::class, 'page_create'])->name('admin.page.create');
    Route::post('/admin/pages/create', [AdminController::class, 'page_store'])->name('admin.page.store');
    Route::get('/admin/pages/edit/{id}', [AdminController::class, 'page_edit'])->name('admin.page.edit');
    Route::post('/admin/pages/edit', [AdminController::class, 'page_update'])->name('admin.page.update');
    Route::get('/admin/pages/delete/{id}', [AdminController::class, 'page_destroy'])->name('admin.page.destroy');

    // Change Status
    Route::post('/admin/change/status', [AdminController::class, 'change_status'])->name('admin.change.status');


    // Social Link
    Route::get('/admin/social_links', [SocialLinkController::class, 'index'])->name('admin.social_links');
    Route::get('/admin/social_links/create', [SocialLinkController::class, 'create'])->name('admin.social_links.create');
    Route::post('/admin/social_links/store', [SocialLinkController::class, 'store'])->name('admin.social_links.store');
    Route::get('/admin/social_links/edit/{id}', [SocialLinkController::class, 'edit'])->name('admin.social_links.edit');
    Route::put('/admin/social_links/update/{id}', [SocialLinkController::class, 'update'])->name('admin.social_links.update');
    Route::get('/admin/social_links/delete/{id}', [SocialLinkController::class, 'destroy'])->name('admin.social_links.destroy');


    // Page Title
    Route::get('/admin/page_titles', [PageTitleController::class, 'index'])->name('admin.page_titles');
    Route::get('/admin/page_titles/edit/{id}', [PageTitleController::class, 'edit'])->name('admin.page_titles.edit');
    Route::put('/admin/page_titles/update/{id}', [PageTitleController::class, 'update'])->name('admin.page_titles.update');

    //Message
    Route::get('/admin/message', [MessageController::class, 'index'])->name('admin.message');
    Route::get('/admin/message/show/{id}', [MessageController::class, 'show'])->name('admin.message.show');
    Route::get('/admin/message/delete/{id}', [MessageController::class, 'destroy'])->name('admin.message.destroy');


    // Pages Images
    Route::get('/admin/page_images', [PageImageController::class, 'index'])->name('admin.page_images');
    Route::get('/admin/page_images/edit/{id}', [PageImageController::class, 'edit'])->name('admin.page_images.edit');
    Route::put('/admin/page_images/update/{id}', [PageImageController::class, 'update'])->name('admin.page_images.update');

    // Pages Images
    Route::get('/admin/email_content', [EmailContentController::class, 'index'])->name('admin.email_content');
    Route::get('/admin/email_content/edit/{id}', [EmailContentController::class, 'edit'])->name('admin.email_content.edit');
    Route::put('/admin/email_content/update/{id}', [EmailContentController::class, 'update'])->name('admin.email_content.update');


    // Error Page
    Route::get('/admin/error_page', [ErrorPageController::class, 'index'])->name('admin.error_page');

    Route::get('/admin/error_page/edit/{id}', [ErrorPageController::class, 'edit'])->name('admin.error_page.edit');
    Route::put('/admin/error_page/update/{id}', [ErrorPageController::class, 'update'])->name('admin.error_page.update');


    // Pages Images
    Route::get('/admin/footer', [FooterController::class, 'index'])->name('admin.footer');
    Route::get('/admin/footer/edit/{id}', [FooterController::class, 'edit'])->name('admin.footer.edit');
    Route::put('/admin/footer/update/{id}', [FooterController::class, 'update'])->name('admin.footer.update');

    // Popup Message
    Route::get('/admin/popup', [PopupMessageController::class, 'index'])->name('admin.popup');
    Route::get('/admin/popup/edit/{id}', [PopupMessageController::class, 'edit'])->name('admin.popup.edit');
    Route::put('/admin/popup/update/{id}', [PopupMessageController::class, 'update'])->name('admin.popup.update');
});

Route::group(["middleware" => ["role:admin"], "prefix" => "admin/blog", "as" => "admin.blog."], function () {
    // Posts
    Route::get('posts', [PostController::class, 'index'])->name("posts");
    Route::get('posts/create', [PostController::class, 'create'])->name('posts.create');
    Route::post('posts/store', [PostController::class, 'store'])->name('posts.store');
    Route::get('posts/edit/{post}', [PostController::class, 'edit'])->name('posts.edit');
    Route::post('posts/update/{post}', [PostController::class, 'update'])->name('posts.update');
    Route::get('posts/delete/{post}', [PostController::class, 'destroy'])->name('posts.destroy');

    // Categories
    Route::get('categories', [BlogCategoryController::class, 'index'])->name('categories');
    Route::get('categories/create', [BlogCategoryController::class, 'create'])->name('categories.create');
    Route::post('categories/store', [BlogCategoryController::class, 'store'])->name('categories.store');
    Route::get('categories/edit/{category}', [BlogCategoryController::class, 'edit'])->name('categories.edit');
    Route::post('categories/update/{category}', [BlogCategoryController::class, 'update'])->name('categories.update');
    Route::get('categories/delete/{category}', [BlogCategoryController::class, 'destroy'])->name('categories.destroy');



    // Comments
    Route::get('comments', [BlogCommentController::class, 'index'])->name('comments');
    Route::get('comments/edit/{comment}', [BlogCommentController::class, 'edit'])->name('comments.edit');
    Route::post('comments/update/{comment}', [BlogCommentController::class, 'update'])->name('comments.update');
    Route::get('comments/delete/{comment}', [BlogCommentController::class, 'destroy'])->name('comments.destroy');
});
