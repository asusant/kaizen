<?php

namespace App\Modules\Rpd\Controllers;

use App\Models\Sianggar\Kegiatan as KegSianggar;
use App\Models\Sikeu\Kegiatan as KegSikeu;
use App\Models\Sikeu\Unit as UnitSikeu;
use App\Bobb\Helpers\Helper as Help;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Modules\Rpd\Services\Rpd;
use App\Models\RpdKegiatanValid;
use App\Models\Sikeu\Setting;
use Illuminate\Http\Request;
use App\Bobb\Services\BAuth;
use App\Models\ValidasiUnit;
use App\Models\RpdKegiatan;
use App\Models\ValidasiRpd;
use App\Models\Sikeu\Pagu;
use App\Models\Sikeu\Spp;
use App\Bobb\Libs\BApp;
use PDF;

class RpdController extends Controller
{

    /**
     * INPUT DATA KEGIATAN RPD
     */

    public function index(Request $req)
    {
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['bulan'] = (new BAuth)->getBulanAktif();
        $data['unit'] = (new BAuth)->getUnitAktif();
        $data['ta'] = substr($data['tahun'], -2);
        $data['unit_sianggar'] = UnitSikeu::getKodeSianggar($data['unit']);
        $data['filter_bulan'] = $req->query('bulan');

        $kIds = KegSikeu::where('k_ta', $data['ta'])->where('k_unit_asli', $data['unit'])->get(['k_id'])->pluck('k_id')->toArray();

        $q = KegSikeu::where('k_ta', $data['ta'])
            ->where('k_unit_asli', $data['unit']);
        if(isset($kIds))
        {
            $q->whereIn('k_id', $kIds);
        }
        $data['data'] = $q->get();
        $data['keg_sianggar'] = KegSianggar::getForSelect([
            'tahun' => $data['tahun'],
            'unit'  => $data['unit_sianggar']
        ]);
        $data['sudah_rpd'] = RpdKegiatan::getRekapRpdPerKId($data['tahun'], $data['unit']);
        $data['rpd_no_prognosa'] = [];
        if(isset($kIds))
        {
            $bulans = range(1, date('n'));
            $data['rpd_no_prognosa'] = (new Rpd)->getRpd($data['tahun'], $bulans, $data['unit'], 0, [], ['except_k_id' => $kIds]);
            if(sizeof($data['rpd_no_prognosa']) > 0)
            {
                session()->flash('alert', ['danger', 'Terdapat '.sizeof($data['rpd_no_prognosa']).' keg. RPD yang prognosanya telah dihapus! '.link_to_route('kegiatan_rpd.no-prognosa.read', 'Lihat Daftar', [], ['class' => 'btn btn-sm btn-success']) ]);
            }
        }
        return view('Rpd::kegiatan.index', $data);
    }

    public function noPrognosa()
    {
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['unit'] = (new BAuth)->getUnitAktif();
        $data['ta'] = substr($data['tahun'], -2);
        $kIds = KegSikeu::where('k_ta', $data['ta'])->where('k_unit_asli', $data['unit'])->get(['k_id'])->pluck('k_id')->toArray();
        $data['data'] = (new Rpd)->getRpd($data['tahun'], range(1, date('n')), $data['unit'], 0, [], ['except_k_id' => $kIds]);
        return view('Rpd::kegiatan.rpd_no_prognosa', $data);
    }

    public function rincian($id)
    {
        $data['prognosa'] = KegSikeu::findOrFail($id);
        $data['data'] = RpdKegiatan::where('k_id', $id)->orderBy('bulan_rpd')->orderBy('bulan_rpd')->get();
        $data['bulan'] = (new BAuth)->getBulanAktif();
        return view('Rpd::kegiatan.rpd', $data);
    }

    public function createRpd($id)
    {
        $data['data'] = [];
        $data['prognosa'] = KegSikeu::findOrFail($id);
        $data['data'] = (new Rpd)->getSourceKeg($data['prognosa']);
        $data['unit_asli'] = (new BAuth)->getUnitAktif();
        $data['unit'] = UnitSikeu::getUnitInduk($data['unit_asli']);
        $data['form_route'] = ['kegiatan_rpd.rincian.store'];
        return view('Rpd::kegiatan.form', $data);
    }

    public function editRpd($id)
    {
        $data['data'] = RpdKegiatan::findOrFail($id);
        $data['prognosa'] = KegSikeu::findOrFail($data['data']->k_id);
        $data['unit_asli'] = (new BAuth)->getUnitAktif();
        $data['unit'] = UnitSikeu::getUnitInduk($data['unit_asli']);
        $data['form_route'] = ['kegiatan_rpd.rincian.update'];
        return view('Rpd::kegiatan.form', $data);
    }

    public function storeRpd(Request $req)
    {
        $this->validate($req, RpdKegiatan::validation_data());

        $tahun = (new BAuth)->getTahunAktif();
        $bulan = (new BAuth)->getBulanAktif();
        $unit = (new BAuth)->getUnitAktif();

        // cek validitas unit
        $cek = (new Rpd)->cekValidasiUnit($unit, $req->input('bulan_rpd'), $tahun);
        if($cek[0] == false)
        {
            return redirect()->back()->with('alert', ['danger', $cek[1]])->withInput();
        }

        // last RPD
        $last = RpdKegiatan::getLastNo($unit, $req->input('bulan_rpd'), $tahun);

        $dt = new RpdKegiatan();
		foreach ($dt->validation_data() as $col => $rule)
		{
			$dt->{$col} = $req->input($col);
        }
        $dt->ls = (new Help)->fetchNominal($dt->ls);
        $dt->up = (new Help)->fetchNominal($dt->up);
        $dt->tahun = $tahun;
        $dt->kd_anggaran = implode(",", (new Rpd)->getKodeAnggaran($dt->k_id) );
        $dt->created_by = Auth::user()->id_user;
        $dt->nomor = $last + 1;
		$dt->save();

        BApp::log('Menambah data RPD Kegiatan. id='.$dt->id_rpd.'.', $req->except('_token'));
        return redirect()->back()->with('alert', ['success', 'Data berhasil ditambah!']);
    }

    public function updateRpd(Request $req)
    {
        $dt = RpdKegiatan::findOrFail($req->input('id_rpd'));
        $this->validate($req, $dt->validation_data());

        // cek validitas unit
        $cek = (new Rpd)->cekValidasiUnit($dt->unit_asli, [$dt->bulan_rpd, $req->input('bulan_rpd')], $dt->tahun);
        if($cek[0] == false)
        {
            return redirect()->back()->with('alert', ['danger', $cek[1]])->withInput();
        }

		foreach ($dt->validation_data() as $col => $rule)
		{
			$dt->{$col} = $req->input($col);
        }
        $dt->ls = (new Help)->fetchNominal($dt->ls);
        $dt->up = (new Help)->fetchNominal($dt->up);
        $dt->kd_anggaran = implode(",", (new Rpd)->getKodeAnggaran($dt->k_id) );
		$dt->updated_by = Auth::user()->id_user;

        BApp::log('Mengubah data Kegiatan RPD. id='.$dt->id_rpd.'.', $dt->getOriginal(), $req->except('_token'));
        $dt->save();
        return redirect()->back()->with('alert', ['success', 'Data berhasil diubah!']);
    }

    public function deleteRPd($id)
    {
        $dt = RpdKegiatan::findOrFail($id);

        // cek validitas unit
        $cek = (new Rpd)->cekValidasiUnit($dt->unit_asli, $dt->bulan_rpd, $dt->tahun);
        if($cek[0] == false)
        {
            return redirect()->back()->with('alert', ['danger', $cek[1]])->withInput();
        }

        BApp::log('Menghapus data Role User. id='.$id.'.', $dt->getAttributes());
        $dt->deleted_by = Auth::user()->id_user;
        $dt->save();
        $dt->delete();

        return redirect()->back()->with('alert', ['success', 'Data berhasil dihapus!']);
    }

    public function migrateRpdNextMonth(Request $req)
    {
        $this->validate($req, ['bulan' => 'required|numeric|min:1|max:11', 'rpd' => 'required|array|min:1']);

        $tahun = (new BAuth)->getTahunAktif();
        // $ta = substr($tahun, -2);
        $bulan = $req->input('bulan');
        $unit = (new BAuth)->getUnitAktif();
        $ids = array_keys($req->input('rpd'));

        $sRpd = new Rpd;
        // ambil data rpd bulan tsb
        $keg = $sRpd->getRealisasi($tahun, $bulan, $unit, 0, $ids);
        $bulanb = $bulan+1;
        $user = Auth::user()->id_user;
        $insert = array();
        $lastNo = [];
        foreach ($keg['kegiatan'] as $key => $r)
        {
            if(!isset($lastNo[$r->unit_asli]))
            {
                // ambil last nomor unit di bulan tsb
                $lastNo[$r->unit_asli] = RpdKegiatan::getLastNo($r->unit_asli, $bulanb, $r->tahun);
            }
            $real_ls = (isset($keg['realisasi_ls'][$r->k_id]) ? $keg['realisasi_ls'][$r->k_id] : 0);
            $real_up = (isset($keg['realisasi_up'][$r->k_id]) ? array_sum($keg['realisasi_up'][$r->k_id]) : 0);
            $sisa_ls = ($r->ls - $real_ls);
            $sisa_up = ($r->up - $real_up);

            if($sisa_ls == 0 && $sisa_up == 0)
            {
                continue;
            }

            $insert[] = [
                'k_id'      => $r->k_id,
                'unit_asli' => $r->unit_asli,
                'unit'      => $r->unit,
                'nomor'     => ++$lastNo[$r->unit_asli],
                'tahun'     => $r->tahun,
                'nm_kegiatan'=> $r->nm_kegiatan,
                'bulan_rpd' => $bulanb,
                'ls'        => $sisa_ls,
                'up'        => $sisa_up,
                'kd_anggaran'=> $r->kd_anggaran,
                'ex_id_rpd' => $r->id_rpd,
                'created_by'=> $user
            ];
        }
        if(sizeof($insert) == 0)
        {
            return redirect()->back()->with('alert', ['danger', 'Gagal menduplikasi kegiatan! <strong>Tidak ada kegiatan dipilih yang memiliki sisa dana.</strong>']);
        }

        RpdKegiatan::insert($insert);
        BApp::log('Menduplikasi data RPD bulan '.$bulan.' ke bulan '.$bulanb, $req->except('_token'));
        return redirect()->back()->with('alert', ['success', 'Berhasil menduplikasi '.sizeof($insert).' kegiatan!']);
    }


    /**
     * RINCIAN RPD (USULAN)
     */

    public function rincianRpd(Request $req, $bulan='', $unit='', $valid=0)
    {
        if($bulan == '')
        {
            $bulan = (new BAuth)->getBulanAktif();
        }
        if($unit == '')
        {
            $unit = (new BAuth)->getUnitAktif();
        }
        $data['bulan'] = $bulan;
        $data['tahun'] = session()->get('bobb_active_tahun');
        $data['unit'] = $unit;
        $data['valid'] = $valid;

        $data['data'] = (new Rpd)->getPerhitunganRpd($data['tahun'], $data['bulan'], $data['unit'], $valid);
        $arr_keg_sikeu = $data['data']['skrg']['kegiatan']->groupBy('k_id')->pluck('k_id')->toArray();
        $data['prognosa'] = KegSikeu::where('k_ta', config('bobb.ta'))->whereIn('k_id', $arr_keg_sikeu)->get();

        // print?
        if($req->get('print') && $req->get('print') == 1)
        {
            $un = UnitSikeu::getUnitInduk($unit);
            $data['setting'] = Setting::getSettingUnit($un->unit_id);
            $pdf = PDF::loadView('Rpd::usulan.usulan_pdf', $data)->setPaper('A4', 'portrait');

            // download PDF file with download method
            return $pdf->download('usulan_rpd_'.$unit.'_'.$bulan.'_'.$valid.'.pdf');
        }

        return view('Rpd::usulan.index', $data);
    }

    /**
     * REALISASI RPD
     */

    public function realisasiRpd(Request $req, $bulan='')
    {
        if($bulan == '')
        {
            $bulan = (new BAuth)->getBulanAktif();
        }
        $data['bulan'] = $bulan;
        $data['tahun'] = session()->get('bobb_active_tahun');
        $data['unit'] = (new BAuth)->getUnitAktif();
        $data['data'] = (new Rpd)->getRealisasi($data['tahun'], $bulan, $data['unit']);

        // print?
        if($req->get('print') && $req->get('print') == 1)
        {
            $un = UnitSikeu::getUnitInduk($data['unit']);
            $data['setting'] = Setting::getSettingUnit($un->unit_id);
            $pdf = PDF::loadView('Rpd::realisasi.realisasi_pdf', $data)->setPaper('A4', 'landscape');

            // download PDF file with download method
            return $pdf->download('realisasi_rpd_'.$data['unit'].'_'.$data['bulan'].'.pdf');
        }
        return view('Rpd::realisasi.index', $data);
    }

    /**
     * Laporan Saldo RPD
     */

    public function saldoRpd(Request $req, $bulan = '')
    {
        if($bulan == '')
        {
            $bulan = (new BAuth)->getBulanAktif();
        }
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['bulan'] = $bulan;
        $data['unit'] = (new BAuth)->getUnitAktif();
        $data['cut_off'] = date('Y-m-t', strtotime($data['tahun'].'-'.($data['bulan']-1).'-'.'01'));

        $ta = substr($data['tahun'], -2);
        // bulan januari - (bulan - 1)
        $bln_cutoff = range(1, $data['bulan'] );

        // service RPD
        $sRpd = new Rpd;
        $data['data'] = $sRpd->getPerhitunganRpd($data['tahun'], $data['bulan'], $data['unit']);
        $data['total_up'] = Spp::getTotalUp($data['unit'],$ta, $bln_cutoff);
        $data['total_pk'] = $sRpd->getPK($ta, $data['unit'], $bln_cutoff, ['sum' => true]);
        $data['total_bpt'] = $sRpd->getPengembalianPk($ta, $data['unit'], $bln_cutoff);

        // print?
        if($req->get('print') && $req->get('print') == 1)
        {
            $un = UnitSikeu::getUnitInduk($data['unit']);
            $data['setting'] = Setting::getSettingUnit($un->unit_id);
            // return view('Rpd::laporan.ba_saldo_pdf', $data);
            $pdf = PDF::loadView('Rpd::laporan.ba_saldo_pdf', $data)->setPaper('A4', 'portrait');

            // download PDF file with download method
            return $pdf->download('ba_saldo_'.$data['unit'].'_'.$data['bulan'].'.pdf');
        }

        return view('Rpd::laporan.index', $data);
    }

    /**
     * Untuk Memvalidasi / Membatasi perubahan RPD Sub Unit
     */

    public function validasiUnit($bulan='')
    {
        if($bulan == '')
        {
            $bulan = (new BAuth)->getBulanAktif();
        }
        $sRpd = new Rpd;
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['bulan'] = $bulan;
        $data['unit'] = (new BAuth)->getUnitAktif();

        // get all subunit
        $subunits = UnitSikeu::getUnitTree($data['unit'], false);

        // ambil data unit yang memiliki RPD di bulan tsb
        $data['data'] = array_keys($sRpd->getRpd($data['tahun'], $data['bulan'], array_keys($subunits))->groupBy('unit_asli')->toArray());

        // ambil data validasi
        $data['data_valid'] = ValidasiUnit::getValidasi($data['tahun'], $data['bulan'], $data['data'])->pluck('is_valid', 'sub_unit')->toArray();

        /**
         * Untuk validasi RPD
         */
        $data['valid_rpd'] = ValidasiRpd::getValidasi($data['tahun'], $data['bulan'], $data['unit'], 'all');

        return view('Rpd::validasi_unit.index', $data);
    }

    public function doValidasiUnit(Request $req)
    {
        $this->validate($req, ['bulan' => 'required|numeric|min:1|max:12', 'validasi' => 'nullable|array']);
        $bulan = $req->input('bulan');
        $validasi = $req->input('validasi');
        $tahun = (new BAuth)->getTahunAktif();
        $unit = (new BAuth)->getUnitAktif();

        $subunits = array_keys(UnitSikeu::getUnitTree($unit, false));

        $unit_validasi = (is_array($validasi) ? $validasi : []);

        $user = Auth::user()->id_user;
        $wkt_valid = date('Y-m-d H:i:s');

        // batalkan validasi yang tidak terpilih
        ValidasiUnit::where('bulan', $bulan)->where('tahun', $tahun)->whereIn('sub_unit', $subunits)->update([
            'is_valid'  => 0,
            'wkt_valid' => $wkt_valid,
            'validator' => $user
        ]);

        // validasi unit terpilih
        $exist = ValidasiUnit::getValidasi($tahun, $bulan, $unit_validasi)->pluck('is_valid', 'sub_unit')->toArray();
        $update = [];
        $insert = [];

        foreach ($unit_validasi as $unit)
        {
            if(isset($exist[$unit]))
            {

                $update[] = $unit;
            }
            else
            {
                $insert[] = [
                    'sub_unit'  => $unit,
                    'tahun'     => $tahun,
                    'bulan'     => $bulan,
                    'is_valid'  => 1,
                    'wkt_valid' => $wkt_valid,
                    'validator' => $user,
                    'created_by'=> $user
                ];
            }
        }

        ValidasiUnit::where('tahun', $tahun)->where('bulan', $bulan)->whereIn('sub_unit', $update)->update([
            'is_valid'  => 1,
            'wkt_valid' => $wkt_valid,
            'validator' => $user
        ]);

        ValidasiUnit::insert($insert);

        BApp::log('Melakukan validasi sub unit', $req->except('_token'));
        return redirect()->back()->with('alert', ['success', 'Berhasil mengubah data validasi sub unit!']);
    }

    public function doAjukanRpd(Request $req)
    {
        $this->validate($req, ['bulan' => 'required|numeric|min:1|max:12']);
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['bulan'] = $req->input('bulan');
        $data['unit'] = (new BAuth)->getUnitAktif();

        $last_versi = ValidasiRpd::getLastVersi($data['tahun'], $data['bulan'], $data['unit']);

        // buat versi baru
        $versi = new ValidasiRpd;
        $versi->unit = $data['unit'];
        $versi->tahun = $data['tahun'];
        $versi->bulan = $data['bulan'];
        $versi->versi = $last_versi+1;
        $versi->sts_valid = 0;
        $versi->created_by = Auth::user()->id_user;
        $versi->save();

        BApp::log('Mengajukan RPD versi '.($last_versi+1).' bulan '.$data['bulan'].' unit '.$data['unit'], $versi);
        return redirect()->back()->with('alert', ['success', 'Berhasil mengajukan versi RPD baru!']);
    }

    public function doAjukanUlangRPd($bulan, $versi)
    {
        $tahun = (new BAuth)->getTahunAktif();
        $unit = (new BAuth)->getUnitAktif();
        $validasi = ValidasiRpd::getValidasi($tahun, $bulan, $unit, 'all', $versi);

        if(sizeof($validasi) == 0)
        {
            return redirect()->back()->with('alert', ['danger', 'Data validasi tidak ditemukan!']);
        }

        $validasi = $validasi->first();

        if(!in_array($validasi->sts_valid, [2]))
        {
            return redirect()->back()->with('alert', ['danger', 'Maaf, hanya dapat mengajukan ajuan dengan status ditolak saja!']);
        }

        $validasi->sts_valid = 0;
        $validasi->created_by = Auth::user()->id_user;
        $validasi->save();

        BApp::log('Mengajukan ulang RPD versi '.($validasi->versi).' bulan '.$bulan.' unit '.$unit, $versi);
        return redirect()->back()->with('alert', ['success', 'Berhasil mengajukan ulang RPD versi '.$versi.'!']);
    }

    /**
     * Validasi Untuk admin
     */

    public function validasiRpd($bulan='')
    {
        if($bulan == '')
        {
            $bulan = (new BAuth)->getBulanAktif();
        }
        $sRpd = new Rpd;
        $data['tahun'] = (new BAuth)->getTahunAktif();
        $data['bulan'] = $bulan;

        // // get all subunit
        // $subunits = ValidasiUnit::getValidasi($data['tahun'], $data['bulan'])->pluck('sub_unit')->toArray();

        // // all subunit group by unit
        // $data['data'] = UnitSikeu::whereIn('unit_id', $subunits)->get()->groupBy('unit_induk');

        // get all unit
        $data['data'] = ValidasiRpd::getValidasi($data['tahun'], $data['bulan'])->groupBy('unit');

        return view('Rpd::validasi_rpd.index', $data);
    }

    public function validateRpd(Request $req)
    {
        $this->validate($req, [
            'bulan'     => 'required|numeric|min:1|max:12',
            'unit'      => 'required|numeric',
            'versi'     => 'required|numeric',
            'sts_valid' => 'required',
            'ket_valid' => 'required|string'
        ]);

        $tahun = (new BAuth)->getTahunAktif();
        $bulan = $req->input('bulan');
        $unit = $req->input('unit');
        $versi = $req->input('versi');
        $sts_valid = $req->input('sts_valid');
        $ket_valid = $req->input('ket_valid');

        $perhitungan_rpd = (new Rpd)->getPerhitunganRpd($tahun, $bulan, $unit);

        // cek apakah ada ajuan tsb?
        $versi = ValidasiRpd::getValidasi($tahun, $bulan, $unit, [0,2], $versi)->first();

        if(!$versi)
        {
            return redirect()->back()->with('alert', ['danger', 'Versi RPD sudah ada sebelumnya!']);
        }

        if($sts_valid == 1)
        {
            $sRpd = new Rpd;

            // Duplikat Keg RPD berjalan ke tabel RPD Valid
            $keg = $sRpd->getRpd($tahun, $bulan, $unit);

            $insert = [];
            foreach ($keg as $k => $r)
            {
                $insert[$k] = [
                    'id_validasi_rpd'   => $versi->id_validasi_rpd
                ];
                foreach ($sRpd->col_migrate_valid as $col)
                {
                    $insert[$k][$col] = $r->{$col};
                }
            }

            RpdKegiatanValid::insert($insert);
        }

        // simpan perhitungan statis
        $versi->saldo_rpd_lalu = $perhitungan_rpd['lalu']['saldo'];
        $versi->pk_lalu = $perhitungan_rpd['lalu']['pk'];
        $versi->bpt_lalu = $perhitungan_rpd['bpt'];
        $versi->spp_up_ini = $perhitungan_rpd['skrg']['total_up'];
        $versi->rpd_final = $perhitungan_rpd['kekurangan_rpd'];

        // ubah status valid
        $versi->sts_valid = $sts_valid;
        $versi->ket_valid = $ket_valid;
        $versi->wkt_valid = date('Y-m-d H:i:s');
        $versi->validator = Auth::user()->id_user;
        $versi->updated_by = Auth::user()->id_user;
        $versi->save();

        BApp::log('Memvalidasi RPD versi '.($versi->versi).' bulan '.$versi->bulan.' unit '.$versi->unit, $versi);
        return redirect()->back()->with('alert', ['success', 'Berhasil mengubah status Valid!']);
    }

    public function transferPagu($id_validasi)
    {
        $validasi = ValidasiRpd::findOrFail($id_validasi);

        if($validasi->sts_valid != 1)
        {
            return redirect()->back()->with('alert', ['danger', 'Hanya dapat melakukan transfer data RPD yang sudah valid!']);
        }

        if($validasi->is_transfered == 1)
        {
            return redirect()->back()->with('alert', ['danger', 'Data ajuan RPD sudah pernah ditransfer!']);
        }

        $ta = substr($validasi->tahun, -2);
        $pagu = Pagu::getTransito($ta, $validasi->unit);

        if($pagu)
        {
            $total_pagu = $pagu->pagu_angka + $validasi->rpd_final;
            $pagu_history = $total_pagu.'#'.$pagu->pagu_angka_lama;

            Pagu::where('pagu_key', $pagu->pagu_key)->update([
                'pagu_angka'        => $total_pagu,
                'pagu_angka_lama'   => $pagu_history
            ]);
        }
        else
        {
            $total_pagu = $validasi->rpd_final;
            $pagu_history = $validasi->rpd_final;

            // insert
            $p_ins = array(
                'pagu_ta'		=> $ta,
                'pagu_program'	=> '08',
                'pagu_kegiatan'	=> '0000',
                'pagu_output'	=> '0000',
                'pagu_suboutput'=> '0000',
                'pagu_komponen'	=> '0000',
                'pagu_subkomponen'=> '0000',
                'pagu_mak'		=> '825113',
                'pagu_unit'		=> $validasi->unit,
                'pagu_cb'		=> '02',
                'pagu_utama'	=> '0000.00.00.00.825113',
                'pagu_utama2'	=> '0000.00.00.00',
                'pagu_utama3'	=> '0000.00.00.00.8255',
                'pagu_utama4'	=> '0000.00.8255',
                'pagu_id'		=> '08.0000.00.00.00.825113.02.'.$ta.'.'.$validasi->unit,
                'pagu_angka'	=> $total_pagu,
                'pagu_jenis'	=> 1,
                'pagu_satker'	=> 5,
                'pagu_blokir'	=> 0,
            );
            Pagu::insert($p_ins);
        }

        $validasi->is_transfered = 1;
        $validasi->wkt_transfer = date('Y-m-d H:i:s');
        $validasi->transfered_by = Auth::user()->id_user;
        $validasi->save();

        BApp::log('Mentransfer Pagu Transito dari ID Validasi '.($validasi->id_validasi_rpd).'.');
        return redirect()->back()->with('alert', ['success', 'Berhasil menambahkan pagu sebesar '. ((new Help)->formatNumber($validasi->rpd_final) ).' ke transito unit '.$validasi->unit.'!']);
    }


    /**
     * Ganti Unit
     */

    public function getGantiUnit()
    {
        $data['unit_aktif'] = (new BAuth)->getUnitAktif(true);
        if($data['unit_aktif'] == 7777)
        {
            $data['list_unit'] = cache('ref_unit_sikeu');
        }
        else
        {
            $data['list_unit'] = UnitSikeu::getUnitTree($data['unit_aktif']);
        }

        return view('Rpd::ganti_unit.index', $data);
    }

    public function doGantiUnit(Request $req)
    {
        // cek existensi unit
        $unit = UnitSikeu::findOrFail($req->input('unit'));

        $unit_aktif = (new BAuth)->getUnitAktif(true);

        // cek apakah merupakan sub unitnya?
        $tree = UnitSikeu::getUnitTree($unit_aktif);

        if(!isset($tree[$unit->unit_id]) || !$tree[$unit->unit_id])
        {
            return redirect()->back()->with('alert', ['danger', 'Anda tidak berhak untuk ganti ke unit tersebut!']);
        }

        // pass
        (new BAuth)->setUnitLain($unit->unit_id);

        return redirect()->back()->with('alert', ['success', 'Berhasil mengubah Unit!']);
    }

}
