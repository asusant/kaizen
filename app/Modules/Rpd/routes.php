<?php

use Illuminate\Support\Facades\Route;
use App\Modules\Rpd\Controllers\RpdController;

/**
 * Input Kegiatan RPD
 */
$slug = 'kegiatan_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [RpdController::class, 'index'])->name($slug.'.read');

    Route::get('/rincian/{id}', [RpdController::class, 'rincian'])->name($slug.'.rincian.read');
    Route::get('/create/{id}', [RpdController::class, 'createRpd'])->name($slug.'.rincian.create');
    Route::post('/store', [RpdController::class, 'storeRpd'])->name($slug.'.rincian.store');
    Route::get('/edit/{id}', [RpdController::class, 'editRpd'])->name($slug.'.rincian.edit');
    Route::post('/update', [RpdController::class, 'updateRpd'])->name($slug.'.rincian.update');
    Route::get('/delete/{id}', [RpdController::class, 'deleteRpd'])->name($slug.'.rincian.delete');

    // migrasi bulan depan
    // ambil sisa dana
    Route::post('/migrate-next-month', [RpdController::class, 'migrateRpdNextMonth'])->name($slug.'.migrate-next-month.store');

    // kegiatan RPD yang prognosanya sudah dihapus
    Route::get('/no-prognosa', [RpdController::class, 'noPrognosa'])->name($slug.'.no-prognosa.read');
});


/**
 * Rincian RPD (Akan Menjadi Usulan)
 */
$slug = 'rincian_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/{bulan?}/{unit?}/{valid?}', [RpdController::class, 'rincianRpd'])->name($slug.'.read');
});

/**
 * Usulan RPD (Usulan yang Sudah divalidasi)
 */
$slug = 'usulan_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [RpdController::class, 'rincianRpd'])->name($slug.'.read');
});

/**
 * Realisasi RPD (Aktif)
 */
$slug = 'realisasi_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/{bulan?}', [RpdController::class, 'realisasiRpd'])->name($slug.'.read');
});

/**
 * Realisasi RPD (Valid)
 */
$slug = 'realisasi_usulan';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [RpdController::class, 'realisasiRpd'])->name($slug.'.read');
});

/**
 * Laporan Saldo RPD
 */
$slug = 'laporan_saldo_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/{bulan?}', [RpdController::class, 'saldoRpd'])->name($slug.'.read');
});

/**
 * Validasi Unit
 */
$slug = 'validasi_unit';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/data/{bulan?}', [RpdController::class, 'validasiUnit'])->name($slug.'.read');
    Route::post('/validate', [RpdController::class, 'doValidasiUnit'])->name($slug.'.validate');
    Route::post('/validate-rpd', [RpdController::class, 'doAjukanRpd'])->name($slug.'.rpd.validate');
    Route::get('/revalidate-rpd/{bulan}/{versi}', [RpdController::class, 'doAjukanUlangRpd'])->name($slug.'.rpd-revalidate.validate');
});

/**
 * Validasi RPD
 */
$slug = 'validasi_rpd';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/data/{bulan?}', [RpdController::class, 'validasiRpd'])->name($slug.'.read');
    Route::post('/validate', [RpdController::class, 'validateRpd'])->name($slug.'.validate');
    Route::get('/transfer-pagu/{id_validasi}', [RpdController::class, 'transferPagu'])->name($slug.'.transfer.validate');
});

/**
 * Ganti Unit Aktif
 */
$slug = 'ganti_unit';
Route::group(['middleware' => ['web','auth'],'namespace' => 'App\Modules'.$nama_modul.'\Controllers','prefix'=>$slug], function () use ($slug){
    Route::get('/', [RpdController::class, 'getGantiUnit'])->name($slug.'.read');
    Route::post('/berubah', [RpdController::class, 'doGantiUnit'])->name($slug.'.create');
});
