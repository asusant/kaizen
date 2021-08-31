<?php

use Illuminate\Support\Facades\Route;
use App\Modules\Kaizen\Controllers\CertificationClassController;
use App\Modules\Kaizen\Controllers\CertificationHistoryController;
use App\Modules\Kaizen\Controllers\EmployeeController;
use App\Modules\Kaizen\Controllers\RefreshmentController;
use App\Modules\Kaizen\Controllers\CertificationController;

/**
 * Employee
 */
$slug = 'employee';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [EmployeeController::class, 'index'])->name($slug.'.read');
    Route::get('/get-data', [EmployeeController::class, 'getData'])->name($slug.'.data.read');
    Route::get('/create', [EmployeeController::class, 'create'])->name($slug.'.create');
    Route::post('/store', [EmployeeController::class, 'store'])->name($slug.'.store');
    Route::get('/edit/{id}', [EmployeeController::class, 'edit'])->name($slug.'.edit');
    Route::post('/update', [EmployeeController::class, 'update'])->name($slug.'.update');
    Route::get('/delete/{id}', [EmployeeController::class, 'delete'])->name($slug.'.delete');
    Route::get('/import', [EmployeeController::class, 'import'])->name($slug.'.import.create');
    Route::post('/import', [EmployeeController::class, 'doImport'])->name($slug.'.do-import.create');
    Route::get('/cert-history/{id}', [EmployeeController::class, 'certHistory'])->name($slug.'.cert-history.read');
});

/**
 * Certification Class
 */
$slug = 'certification_class';

Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [CertificationClassController::class, 'index'])->name($slug.'.read');
    Route::get('/create', [CertificationClassController::class, 'create'])->name($slug.'.create');
    Route::post('/store', [CertificationClassController::class, 'store'])->name($slug.'.store');
    Route::get('/edit/{id}', [CertificationClassController::class, 'edit'])->name($slug.'.edit');
    Route::post('/update', [CertificationClassController::class, 'update'])->name($slug.'.update');
    Route::get('/delete/{id}', [CertificationClassController::class, 'delete'])->name($slug.'.delete');
});

/**
 * Certification History
 */
$slug = 'certification_history';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [CertificationHistoryController::class, 'index'])->name($slug.'.read');
    Route::get('/get-data', [CertificationHistoryController::class, 'getData'])->name($slug.'.data.read');
    Route::get('/create', [CertificationHistoryController::class, 'create'])->name($slug.'.create');
    Route::post('/store', [CertificationHistoryController::class, 'store'])->name($slug.'.store');
    Route::get('/edit/{id}', [CertificationHistoryController::class, 'edit'])->name($slug.'.edit');
    Route::post('/update', [CertificationHistoryController::class, 'update'])->name($slug.'.update');
    Route::get('/delete/{id}', [CertificationHistoryController::class, 'delete'])->name($slug.'.delete');
    Route::get('/import', [CertificationHistoryController::class, 'import'])->name($slug.'.import.create');
    Route::post('/import', [CertificationHistoryController::class, 'doImport'])->name($slug.'.do-import.create');
});


/**
 * Refreshment
 */
$slug = 'refreshment';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [RefreshmentController::class, 'index'])->name($slug.'.read');
    Route::post('/result/{print?}', [RefreshmentController::class, 'findRefreshment'])->name($slug.'.create');
});

/**
 * Certification
 */
$slug = 'certification';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [CertificationController::class, 'index'])->name($slug.'.read');
});
