@extends('layouts.be-print')

@section('content')
<div class="row center">
    <p class="title">Data Rincian Rencana Penarikan Dana<br>{{ 'Bulan '.(new Help)->bulan($bulan).' '.$tahun }}<br>Unit {{ cache('ref_unit_sikeu')[$unit] }}</p>
</div>
<br><br>
<div class="row center" style="width: 100%" width="100%">
    <table class="table data" style="width: 100%" width="100%">
        <thead>
            <tr>
                <th rowspan="2" class="center">Kode</th>
                <th rowspan="2" class="center">Nama Kegiatan</th>
                <th rowspan="2" class="center">Kode Anggaran</th>
                <th colspan="2" class="center">RPD</th>
            </tr>
            <tr>
                <th class="center">LS</th>
                <th class="center">UP</th>
            </tr>
            <tr>
                @for ($i = 1; $i < 6; $i++)
                <th class="center">{{ $i }}</th>
                @endfor
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td colspan="4"><strong>KEGIATAN BULAN INI</strong></td>
            </tr>
            @foreach ($data['skrg']['kegiatan'] as $r)
            <tr>
                <td class="center">{{ $r->bulan_rpd.'.'.$r->unit_asli.'.'.$r->nomor }}</td>
                <td>{{ $r->nm_kegiatan }}</td>
                <td class="center">{!! implode('<br>', explode(',', $r->kd_anggaran)) !!}</td>
                <td class="right">{{ (new Help)->formatNumber($r->ls) }}</td>
                <td class="right">{{ (new Help)->formatNumber($r->up) }}</td>
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td colspan="2" class="right"><strong>TOTAL</strong></td>
                <td class="right">{{ (new Help)->formatNumber($data['skrg']['kegiatan']->sum('ls')) }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['skrg']['kegiatan']->sum('up')) }}</td>
            </tr>
            <tr>
                <td colspan="3" class="right"><strong>Saldo RPD UP Bulan Lalu</strong></td>
                <td class="right">{{ '-' }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['lalu']['saldo']) }}</td>
            </tr>
            <tr>
                <td colspan="3" class="right"><strong>BPT Bulan Lalu</strong></td>
                <td class="right">{{ '-' }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['bpt']) }}</td>
            </tr>
            <tr>
                <td colspan="3" class="right"><strong>RPD yang dimintakan</strong></td>
                <td class="right">{{ '-' }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['rpd_diminta']) }}</td>
            </tr>
            <tr>
                <td colspan="3" class="right"><strong>Total SPP UP/TUP Bulan ini</strong></td>
                <td class="right">{{ '-' }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['skrg']['total_up']) }}</td>
            </tr>
            <tr>
                <td colspan="3" class="right"><strong>Kekurangan SPP UP/TUP Bulan Ini</strong></td>
                <td class="right">{{ '-' }}</td>
                <td class="right">{{ (new Help)->formatNumber($data['kekurangan_rpd']) }}</td>
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
