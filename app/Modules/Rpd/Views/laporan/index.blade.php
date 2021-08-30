@extends('layouts.be-dashboard')

@section('title')
Berita Acara Saldo RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Berita Acara Saldo RPD' }}
@endsection

@section('header-desc')
{{ 'Berita Acara Saldo RPD' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Berita Acara Saldo Rencana Penarikan Dana' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row mb-2">
        <div class="d-flex justify-content-end">
            <div class="btn-group dropdown-icon-wrapper me-1 mb-1">
                <a href="{{ route('laporan_saldo_rpd.read', ['bulan' => $bulan, 'print' => '1']) }}" class="btn btn-success"><span class="bi bi-printer"></span> Print</a>
                <button type="button" class="btn btn-primary">
                    <span class="bi bi-calendar-date"></span>
                    Bulan
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ (new Help)->bulan($bulan) }}
                </button>
                <div class="dropdown-menu">
                    @foreach ((new Help)->listbulan() as $idB => $nmB)
                    <a href="{{ route('laporan_saldo_rpd.read', ['bulan' => $idB]) }}" class="dropdown-item">
                        {{ $nmB }}
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-center">
                <h4 class="card-title text-center">
                    Berita Acara RPD UP<br>
                    Bulan {{ (new Help)->bulan($bulan).' '.$tahun }}<br>
                    Unit: {{ cache('ref_unit_sikeu')[$unit] }}<br>
                    Cut Off: {{ (new Help)->parseDate($cut_off) }}
                </h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered ">
                            <tbody>
                                {{-- A --}}
                                @php
                                    $total_a = $data['lalu']['saldo'] + $data['bpt'];
                                    $total_b = $total_up - $total_pk + $total_bpt;
                                @endphp
                                <tr>
                                    <td><strong>A</strong></td>
                                    <td colspan="3"><strong>Saldo RPD UP</strong></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Saldo RPD UP Akhir Bulan</td>
                                    <td>{{ (new Help)->formatNumber($data['lalu']['saldo']) }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Pengembalian Tunai (BPT_PK)</td>
                                    <td>{{ (new Help)->formatNumber($data['bpt']) }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2"><strong>Total</strong></td>
                                    <td><strong>{{ (new Help)->formatNumber($total_a) }}</strong></td>
                                </tr>

                                {{-- B --}}
                                <tr>
                                    <td><strong>B</strong></td>
                                    <td colspan="3"><strong>Saldo Kas</strong></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Total Penerimaan UP/TUP</td>
                                    <td>{{ (new Help)->formatNumber($total_up) }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Total Panjar Kerja (PK)</td>
                                    <td>{{ (new Help)->formatNumber($total_pk) }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>Total Pengembalian Tunai (BPT_PK)</td>
                                    <td>{{ (new Help)->formatNumber($total_bpt) }}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2"><strong>Total</strong></td>
                                    <td><strong>{{ (new Help)->formatNumber($total_b) }}</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                    <td><strong>Selisih</strong></td>
                                    <td><strong>{{ (new Help)->formatNumber($total_a - $total_b) }}</strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
