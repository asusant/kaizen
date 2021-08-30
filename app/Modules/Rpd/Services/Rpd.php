<?php

namespace App\Modules\Rpd\Services;

use DB;
use App\Models\Sikeu\Spp;
use App\Models\ValidasiRpd;
use App\Bobb\Helpers\Helper;
use App\Models\ValidasiUnit;
use App\Models\Sikeu\Unit as UnitSikeu;
use App\Models\Sikeu\Kegiatan as KegSikeu;

class Rpd
{
    public $tabel_rpd = 'rpd_kegiatan';
    public $tabel_rpd_valid = 'rpd_kegiatan_valid';
    public $col_migrate_valid = ['id_rpd', 'k_id', 'unit_asli', 'unit', 'nomor', 'nm_kegiatan', 'tahun', 'bulan_rpd', 'ls', 'up', 'kd_anggaran', 'ex_id_rpd'];

    /**
     * Untuk perhitungan RPD (form usulan RPD)
     *
     * @param int $tahun
     * @param int $bulan
     * @param int $unit
     * @param int $valid --> untuk mendefinisikan sumber data (data usulan unit berjalan / data yg sudah divalidasi)
     * @return array
     */
    public function getPerhitunganRpd($tahun, $bulan, $unit, $valid = 0)
    {
        $bln_lalu = $bulan - 1;
        // array bulan januari - bulan sekarang
        $bulanA = range(1, $bulan);
        // array bulan januari - bulan sebelum
        $bulanB = range(1, $bulan-1);
        // ta
        $ta = substr($tahun, -2);

        $dt = array('lalu' => array(), 'skrg' => array(), 'bpt' => 0);
        if($tahun == 2021 && $bulan == 5)
        {
            // Sumber dari Saldo Kas (UP+TUP-PK+ Pengembalian PK (khusus: hingga bulan - 1) )
            // array bulan januari - maret
            $bulanC = range(1,3);
            $up_tup_lalu = Spp::getTotalUp($unit,$ta,$bulanB);
            $pk_lalu = $this->getPK($ta,$unit,$bulanB,['sum' => true]);

            $bpt_jan_maret = $this->getPengembalianPk($ta,$unit,$bulanC);

            // $dt['lalu']['up'] = $up_tup_lalu;
            $dt['lalu']['pk'] = $pk_lalu;
            $dt['lalu']['saldo'] = $up_tup_lalu - $pk_lalu + $bpt_jan_maret;

            // Sumber dari BPT bulan januari - april
            $dt['bpt'] = $this->getPengembalianPk($ta,$unit,$bln_lalu);
        }
        else
        {
            // Sumber dari RPD bulan lalu - PK bulan lalu
            $dt['lalu']['pk'] = 0;
            $dt['lalu']['saldo'] = 0;
            $dt['bpt'] = 0;
            if($bln_lalu != 0)
            {
                $rpd_lalu = $this->getRpd($tahun, $bln_lalu, $unit, $valid);
                if(sizeof($rpd_lalu) > 0)
                {
                    $pk_lalu = $this->getPK($ta,$unit,$bln_lalu,['sum' => true, 'id_kegiatan', $rpd_lalu->pluck('k_id')->toArray()]);
                    $dt['lalu']['pk'] = $pk_lalu;
                    $dt['lalu']['saldo'] = $rpd_lalu->sum('up') - $pk_lalu;

                    // Sumber dari BPT bulan lalu
                    $dt['bpt'] = $this->getPengembalianPk($ta,$unit,$bln_lalu);
                }
            }
        }

        if($valid)
        {
            $valid = ValidasiRpd::getValidasi($tahun, $bulan, $unit, 1, $valid)->first();
            if(isset($rpd_lalu) && sizeof($rpd_lalu) > 0)
            {
                $dt['lalu']['saldo'] = $rpd_lalu->sum('up') - $valid->pk_lalu;
            }
            $dt['skrg']['total_up'] = $valid->spp_up_ini;
            $valid = $valid->versi;
        }
        else
        {
            $dt['skrg']['total_up'] = Spp::getTotalUp($unit,$ta,$bulan);
        }

        $dt['skrg']['kegiatan'] = $this->getRpd($tahun, $bulan, $unit, $valid);
        $dt['skrg']['total_rpd_up'] = $dt['skrg']['kegiatan']->sum('up');
        $dt['skrg']['total_rpd_ls'] = $dt['skrg']['kegiatan']->sum('ls');
        $dt['rpd_diminta'] =  $dt['skrg']['total_rpd_up'] - ($dt['lalu']['saldo'] + $dt['bpt']);
        $dt['kekurangan_rpd'] = $dt['rpd_diminta'] - $dt['skrg']['total_up'];

        return $dt;
    }

    /**
     * Get Realisasi Kegiatan RPD
     *
     * @param int $tahun
     * @param int $bulan
     * @param int $unit
     * @param int $valid
     * @return array --> untuk mendefinisikan sumber data (data usulan unit berjalan / data yg sudah divalidasi)
     */
    public function getRealisasi($tahun, $bulan, $unit, $valid = 0, $ids=array())
    {
        $ta = substr($tahun, -2);
        // Unit realisasi adalah unit induk
        $unit_induk = UnitSikeu::getUnitInduk($unit);
        $dt = [];
        $dt['kegiatan'] = $this->getRpd($tahun, $bulan, $unit, $valid, $ids);
        $dt['realisasi_up'] = $this->getPK($ta, $unit_induk, $bulan, ['id_kegiatan' => $dt['kegiatan']->pluck('k_id')->toArray() ]);
        $dt['realisasi_ls'] = $this->getSpumLs($tahun, $bulan, $dt['kegiatan']->pluck('k_id')->toArray());
        return $dt;
    }

    /**
     * Ambil data RPD Dari unit spesifik
     *
     * @param mixed $tahun
     * @param mixed $bulan
     * @param mixed $unit
     * @param string $source
     * @return mixed
     */
    public function getRpd($tahun, $bulan, $unit, $valid=0, $ids = array(), $filter = array())
    {
        DB::enableQueryLog();
        extract($filter);

        $source = $this->tabel_rpd;
        if($valid)
        {
            $source = $this->tabel_rpd_valid;
        }
        $q = DB::table($source.' as a');
        $q->where(function ($w) use($unit) {
            if(is_array($unit))
            {
                $w->whereIn('a.unit', $unit)
                    ->orWhereIn('a.unit_asli', $unit);
            }
            else
            {
                $w->where('a.unit', $unit)
                    ->orWhere('a.unit_asli', $unit);
            }
        });
        if(is_array($bulan))
        {
            $q->whereIn('a.bulan_rpd', $bulan);
        }
        else
        {
            $q->where('a.bulan_rpd', $bulan);
        }
        if(is_array($ids) && sizeof($ids) > 0)
        {
            $q->whereIn('a.id_rpd', $ids);
        }
        if($valid)
        {
            $q->join('rpd_validasi as b', function($j){
                $j->on('a.id_validasi_rpd', '=', 'b.id_validasi_rpd');
                // $j->on('a.bulan_rpd', '=', 'b.bulan');
                // $j->on('a.tahun', '=', 'b.tahun');
                // $j->on('a.unit', '=', 'b.unit');
            });
            $q->where('b.versi', $valid);
            $q->whereNull('b.deleted_at');
        }
        if(isset($except_k_id) && is_array($except_k_id))
        {
            $q->whereNotIn('a.k_id', $except_k_id);
        }
        $q->where('a.tahun', $tahun);
        $q->whereNull('a.deleted_at');
        return $q->get(['a.*']);
    }

    /**
     * Get data PK dari sikeu
     *
     * @param int $ta
     * @param int $unit
     * @param mixed $bulan
     * @param array $filter
     * @return mixed
     */
    public function getPK($ta, $unit, $bulan, $filter = array())
	{
        extract($filter);

		$q = DB::connection('sikeu')->table('tu_kas as a');
        $q->join('surat_ppk as b', 'a.spby_id', '=', 'b.id');
        if(isset($id_kegiatan))
        {
            if(is_array($id_kegiatan))
            {
                $q->whereIn('b.spby_kegiatan', $id_kegiatan);
            }
            else
            {
                $q->where('b.spby_kegiatan', $id_kegiatan);
            }
        }
		$q->where('kas_jenis', 4);
		$q->where('kas_buku', 3);
		$q->whereIn('kas_jenis_pk', [1,2]); # UP | TUP
        $q->where('kas_debet', '>', 0);
        $q->where('kas_ta', $ta);
        if(is_array($bulan))
        {
            $q->whereRaw('MONTH(kas_tanggal_transaksi) IN ('.implode(',', $bulan).')');
        }
        else
        {
            $q->whereRaw('MONTH(kas_tanggal_transaksi)='.$bulan);
        }
        $q->where('kas_unit',$unit);

		$q->orderBy('kas_nomor', 'desc');
		$q->select(
			'a.kas_debet',
			'a.kas_metode_pembayaran',
			'a.kas_pk',
			'b.spby_kegiatan'
        );

        if(isset($sum))
        {
            return $q->sum('kas_debet');
        }

		$dt = array();
		foreach ($q->get() as $row)
		{
			if(!isset($dt[$row->spby_kegiatan]))
				$dt[$row->spby_kegiatan] = array(0 => 0, 1 => 0, 2 => array());

			$dt[$row->spby_kegiatan][$row->kas_metode_pembayaran] += $row->kas_debet;
		}

		return $dt;
	}

    /**
     * Ambil Pengembalian PK (BPT) -- mostly ambil untuk bulan lalu saja
     *
     * @param int $ta
     * @param int $unit
     * @param mixed $bln
     * @return int
     */
    public function getPengembalianPk($ta, $unit, $bln)
	{
		$q = DB::connection('sikeu')->table('tu_kas as a');
		$q->where('kas_ta', $ta);
		$q->where('kas_unit', $unit);
		$q->where('kas_jenis', 6);
		$q->where('kas_buku', 2);
        if(is_array($bln))
        {
            $q->whereRaw('MONTH(kas_tanggal_transaksi) IN ('.implode(',',$bln).')');
        }
        else
        {
            $q->whereRaw('MONTH(kas_tanggal_transaksi) = '.$bln);
        }
		$q->where('kas_debet', '>', 0);
		$d = $q->get();

		if(sizeof($d) > 0)
		{
			$pk = 0;
			foreach ($d as $r)
			{
				$pk += $r->kas_debet;
			}
			return $pk;
		}
		else
		{
			return 0;
		}
    }

    /**
     * Ambil data kode Anggaran dari spesifik prognosa
     *
     * @param int $k_id
     * @return array
     */
    public function getKodeAnggaran($k_id)
    {
        $keg_sikeu = KegSikeu::find($k_id);

        $pagu_bagi = DB::connection('sikeu')
            ->table('tu_pagu_pembagian as a')
            ->join('tu_pagu as b', 'a.pagu_key', '=', 'b.pagu_key')
            ->where('a.kegiatan', $keg_sikeu->keg_sianggar_id)
            ->where('a.ta', $keg_sikeu->k_ta)
            ->get([
                DB::raw('REPLACE(pagu_utama, "023.017.DK.", "") as pagu_utama')
            ])->pluck('pagu_utama')->toArray();

        $dt = [];
        foreach($pagu_bagi as $kd_pagu)
        {
            $kd_a = explode(".",$kd_pagu);
            array_pop($kd_a);
            $dt[] = implode(".",$kd_a);
        }
        return $dt;
    }

    /**
     * Ambil data SPUM LS untuk realisasi LS
     *
     * @param int $tahun
     * @param int $bulan
     * @param mixed $id_kegiatan
     * @return array
     */
    public function getSpumLs($tahun, $bulan, $id_kegiatan)
	{
		$q = DB::connection('sikeu')->table('tu_transaksi as a');
		$q->join('tu_spp as b', 'a.transaksi_spp', '=', 'b.id');
		if(is_array($id_kegiatan))
		{
            $q->whereIn('a.transaksi_kegiatan', $id_kegiatan);
		}
		else
		{
			$q->where('a.transaksi_kegiatan', $id_kegiatan);
		}
        $q->where('b.spm_jadi', '1');
        $q->whereIn('b.jenis', ['6', '5']);

        $mulai = strtotime($tahun.'-'.$bulan.'-1 00:00:01');
        $sampai = strtotime(date('Y-m-t H:i:s', strtotime($tahun.'-'.$bulan.'-1 23:59:01')));

        $q->where('b.spm_tanggal', '>=', $mulai);
        $q->where('b.spm_tanggal', '<=', $sampai);

        $q = $q->get(['transaksi_kegiatan', 'transaksi_jumlah']);

		$dt = array();

		foreach ($q as $row)
		{
			if(!isset($dt[$row->transaksi_kegiatan]))
				$dt[$row->transaksi_kegiatan] = 0;

			$dt[$row->transaksi_kegiatan] += $row->transaksi_jumlah;
		}

		return $dt;
    }

    public function cekValidasiUnit($sub_unit, $bulan, $tahun)
    {
        $q = ValidasiUnit::where('sub_unit', $sub_unit)->where('tahun', $tahun);

        if(is_array($bulan))
        {
            $bln = min($bulan);
            $q->where(function($w) use($bulan){
                $i = 0;
                foreach ($bulan as $b)
                {
                    if($i = 0)
                        $w->where('bulan', '>=', $b);
                    else
                        $w->orWhere('bulan', '>=', $b);
                    $i++;
                }
            });
        }
        else
        {
            $bln = $bulan;
            $q->where('bulan', '>=', $bulan);
        }
        $q->where('is_valid', 1);
        $cek = $q->orderBy('bulan', 'desc')->first();

        if($cek)
        {
            $ret = [
                0   => false,
                1   => 'Tidak dapat mengubah data RPD bulan <strong>'.(new Helper)->bulan($bln).'</strong> karena sudah divalidasi. Validasi terakhir: <strong>'.(new Helper)->bulan($cek->bulan).'</strong>'
            ];
        }
        else
        {
            $ret = [
                0   => true,
                1   => 'Boleh mengubah data.'
            ];
        }

        return $ret;
    }

    /**
     * Untuk mengambil data awal RPD / digunakan saat create kegiatan RPD baru
     *
     * @return void
     */
    public function getSourceKeg($keg_sikeu)
    {
        $data = [
            'bulan_rpd'     => date('n'),
            'nm_kegiatan'   => $keg_sikeu->k_keterangan,
            'up'            => 0,
            'ls'            => 0
        ];

        switch ($keg_sikeu->p_kelompok_anggaran) {
            case '6':
                if($keg_sikeu->p_cara_pembayaran === 0)
                {
                    $termin = explode(';', $keg_sikeu->p_termin_pembayaran);
                    foreach ($termin as $nT)
                    {
                        if($nT > 0)
                        {
                            // cek sudah adakah di rpd sebelumnya?
                            $cek = DB::table($this->tabel_rpd)->where('k_id', $keg_sikeu->k_id)->where('ls', $nT)->whereNull('deleted_at')->first();
                            if(!$cek)
                            {
                                $data['ls'] = $nT;
                                break;
                            }
                        }
                    }
                }
                elseif($keg_sikeu->p_cara_pembayaran == 1)
                {
                    // 100%
                    $data['ls'] = $keg_sikeu->p_nominal_nego;
                }
                break;

            default:
                # code...
                break;
        }

        return $data;
    }
}
