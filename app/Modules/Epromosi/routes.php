<?php

use Illuminate\Support\Facades\Route;
use App\Modules\Epromosi\Controllers\EpromosiController;

/**
 * E-Promosi
 */
$slug = 'p-promo';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [EpromosiController::class, 'promoIndex'])->name($slug.'.read');
    Route::get('/create', [EpromosiController::class, 'promoCreate'])->name($slug.'.create');
    Route::post('/store', [EpromosiController::class, 'promoStore'])->name($slug.'.store');
    Route::get('/edit/{id}', [EpromosiController::class, 'promoEdit'])->name($slug.'.edit');
    Route::post('/update', [EpromosiController::class, 'promoUpdate'])->name($slug.'.update');
    Route::get('/delete/{id}', [EpromosiController::class, 'promoDelete'])->name($slug.'.delete');
});

$slug = 'p-kategori';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [EpromosiController::class, 'index'])->name($slug.'.read');
    Route::get('/create', [EpromosiController::class, 'katCreate'])->name($slug.'.create');
    Route::post('/store', [EpromosiController::class, 'katStore'])->name($slug.'.store');
    Route::get('/edit/{id}', [EpromosiController::class, 'katEdit'])->name($slug.'.edit');
    Route::post('/update', [EpromosiController::class, 'katUpdate'])->name($slug.'.update');
    Route::get('/delete/{id}', [EpromosiController::class, 'katDelete'])->name($slug.'.delete');
});

$slug = 'p-item';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [EpromosiController::class, 'itemIndex'])->name($slug.'.read');
    Route::get('/create', [EpromosiController::class, 'itemCreate'])->name($slug.'.create');
    Route::post('/store', [EpromosiController::class, 'itemStore'])->name($slug.'.store');
    Route::get('/edit/{id}', [EpromosiController::class, 'itemEdit'])->name($slug.'.edit');
    Route::post('/update', [EpromosiController::class, 'itemUpdate'])->name($slug.'.update');
    Route::get('/delete/{id}', [EpromosiController::class, 'itemDelete'])->name($slug.'.delete');
});
