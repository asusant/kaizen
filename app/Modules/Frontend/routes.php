<?php

use Illuminate\Support\Facades\Route;
use App\Modules\Epromosi\Controllers\EpromosiController;

/**
 * E-Promosi
 */
$slug = 'frontend';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [EpromosiController::class, 'index'])->name($slug.'.read');
});
