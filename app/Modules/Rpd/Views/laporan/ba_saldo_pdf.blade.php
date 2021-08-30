@extends('layouts.be-print')

@section('content')
<div class="row center">
    <p class="title">
        Berita Acara Rencana Penarikan Dana UP<br>
        Bulan {{ (new Help)->bulan($bulan).' '.$tahun }}<br>
        Unit: {{ cache('ref_unit_sikeu')[$unit] }}<br>
        Cut Off: {{ (new Help)->parseDate($cut_off) }}
    </p>
</div>
<br><br>
<div class="row center" style="width: 100%" width="100%">
    <table class="table data" widht="100%" style="width: 100%">
        <tbody>
            {{-- A --}}
            @php
                $total_a = $data['lalu']['saldo'] + $data['bpt'];
                $total_b = $total_up - $total_pk + $total_bpt;
            @endphp
            <tr>
                <td width="5%"><strong>A</strong></td>
                <td colspan="3"><strong>Saldo RPD UP</strong></td>
            </tr>
            <tr>
                <td></td>
                <td>Saldo RPD UP Akhir Bulan</td>
                <td class="right">{{ (new Help)->formatNumber($data['lalu']['saldo']) }}</td>
                <td class="right"></td>
            </tr>
            <tr>
                <td></td>
                <td>Pengembalian Tunai (BPT_PK)</td>
                <td class="right">{{ (new Help)->formatNumber($data['bpt']) }}</td>
                <td class="right"></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" class="right"><strong>Total</strong></td>
                <td class="right"><strong>{{ (new Help)->formatNumber($total_a) }}</strong></td>
            </tr>

            {{-- B --}}
            <tr>
                <td><strong>B</strong></td>
                <td colspan="3"><strong>Saldo Kas</strong></td>
            </tr>
            <tr>
                <td></td>
                <td>Total Penerimaan UP/TUP</td>
                <td class="right">{{ (new Help)->formatNumber($total_up) }}</td>
                <td class="right"></td>
            </tr>
            <tr>
                <td></td>
                <td>Total Panjar Kerja (PK)</td>
                <td class="right">{{ (new Help)->formatNumber($total_pk) }}</td>
                <td class="right"></td>
            </tr>
            <tr>
                <td></td>
                <td>Total Pengembalian Tunai (BPT_PK))</td>
                <td class="right">{{ (new Help)->formatNumber($total_bpt) }}</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" class="right"><strong>Total</strong></td>
                <td class="right"><strong>{{ (new Help)->formatNumber($total_b) }}</strong></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td class="right"><strong>Selisih</strong></td>
                <td class="right"><strong>{{ (new Help)->formatNumber($total_a - $total_b) }}</strong></td>
            </tr>
        </tbody>
    </table>
</div>
<br><br>
<div class="row">
    <table class="nb" width="100%">
        <tr>
            <td width="5%"></td>
            <td width="35%">
                <br>
                Pejabat Pembuat Komitmen,
                <br><br><br><br>
                {{ $setting->unit_atasan_pekas }}<br>
                NIP. {{ $setting->unit_nip_atasan_pekas }}
            </td>
            <td width="30%"></td>
            <td>
                Semarang, {{ (new Help)->parseDate(date('Y-m-d')) }}<br>
                BPP,
                <br><br><br><br>
                {{ $setting->unit_pekas }}<br>
                NIP. {{ $setting->unit_nip_pekas }}
            </td>
        </tr>
    </table>
</div>
@endsection
