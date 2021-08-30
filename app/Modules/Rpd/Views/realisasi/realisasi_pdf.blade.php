@extends('layouts.be-print')

@section('content')
<div class="row center">
    <p class="title">Data Realisasi Rencana Penarikan Dana<br>{{ 'Bulan '.(new Help)->bulan($bulan).' '.$tahun }}<br>Unit {{ cache('ref_unit_sikeu')[$unit] }}</p>
</div>
<br><br>
<div class="row center" style="width: 100%" width="100%">
    <table class="table data" style="width: 100%" width="100%">
        <thead>
            <tr class="table-dark">
                <td rowspan="2" class="center">Nomor</td>
                <td rowspan="2" class="center">Nama Kegiatan</td>
                <td rowspan="2" class="center">Kode Anggaran</td>
                <td colspan="2" class="center">RPD</td>
                <td colspan="2" class="center">Realisasi</td>
                <td colspan="2" class="center">Sisa Dana</td>
            </tr>
            <tr class="table-dark">
                <td class="center">LS</td>
                <td class="center">UP</td>
                <td class="center">LS</td>
                <td class="center">UP</td>
                <td class="center">LS</td>
                <td class="center">UP</td>
            </tr>
            <tr class="table-dark">
                @for ($i = 1; $i < 10; $i++)
                <td class="center">{{ $i }}</td>
                @endfor
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="9"><strong>KEGIATAN BULAN INI</strong></td>
            </tr>
            @php
                $sum_real_ls = 0;
                $sum_real_up_tunai = 0;
                $sum_real_up_non = 0;
                $sum_sisa_ls = 0;
                $sum_sisa_up = 0;
            @endphp
            @foreach ($data['kegiatan'] as $r)
            @php
                $real_ls = 0;
                $real_up_tunai = 0;
                $real_up_non = 0;
                $sisa_ls = 0;
                $sisa_up = 0;

                $real_ls = (isset($data['realisasi_ls'][$r->k_id]) ? $data['realisasi_ls'][$r->k_id] : 0);
                $real_up_tunai = (isset($data['realisasi_up'][$r->k_id]) ? $data['realisasi_ls'][$r->k_id][0] : 0);
                $real_up_non = (isset($data['realisasi_up'][$r->k_id]) ? $data['realisasi_ls'][$r->k_id][1] : 0);
                $sisa_ls = $r->ls - $real_ls;
                $sisa_up = $r->up - $real_up_tunai - $real_up_non;

                $sum_real_ls += $real_ls;
                $sum_real_up_tunai += $real_up_tunai;
                $sum_real_up_non += $real_up_non;
                $sum_sisa_ls += $sisa_ls;
                $sum_sisa_up += $sisa_up;
            @endphp
            <tr>
                <td class="center">{{ $r->bulan_rpd.'.'.$r->unit_asli.'.'.$r->nomor }}</td>
                <td>{{ $r->nm_kegiatan }}</td>
                <td class="center">{!! implode('<br>', explode(',', $r->kd_anggaran)) !!}</td>
                <td class="right">{{ (new Help)->formatNumber($r->ls) }}</td>
                <td class="right">{{ (new Help)->formatNumber($r->up) }}</td>
                <td class="right">{{ (new Help)->formatNumber($real_ls) }}</td>
                <td class="right">
                    T: {{ (new Help)->formatNumber($real_up_tunai) }}<br>
                    NT: {{ (new Help)->formatNumber($real_up_non) }}
                </td>
                <td class="right">{{ (new Help)->formatNumber($sisa_ls) }}</td>
                <td class="right">{{ (new Help)->formatNumber($sisa_up) }}</td>
            </tr>
            @endforeach
            <tr>
                <td colspan="3" class="right"><strong>TOTAL</strong></td>
                <td class="right">{{ (new Help)->formatNumber($data['kegiatan']->sum('ls')) }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['kegiatan']->sum('up')) }}</td>
                <td class="right">{{ (new Help)->formatNumber($sum_real_ls) }}</td>
                <td class="right">
                    T: {{ (new Help)->formatNumber($sum_real_up_tunai) }}<br>
                    NT: {{ (new Help)->formatNumber($sum_real_up_non) }}
                </td>
                <td class="right">{{ (new Help)->formatNumber($sum_sisa_ls) }}</td>
                <td class="right">{{ (new Help)->formatNumber($sum_sisa_up) }}</td>
            </tr>
        </tbody>
    </table>
</div>
<br><br>
<div class="row">
    <table class="nb" width="100%">
        <tr>
            <td width="65%"></td>
            <td>
                Semarang, {{ (new Help)->parseDate(date('Y-m-d')) }}<br>
                Pejabat Pembuat Komitmen,
                <br><br><br><br>
                {{ $setting->unit_atasan_pekas }}<br>
                NIP. {{ $setting->unit_nip_atasan_pekas }}
            </td>
        </tr>
    </table>
</div>
@endsection
