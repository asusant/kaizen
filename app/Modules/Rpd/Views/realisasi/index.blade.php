@extends('layouts.be-dashboard')

@section('title')
Realisasi RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Realisasi RPD' }}
@endsection

@section('header-desc')
{{ 'Data Realisasi RPD' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Realisasi RPD' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row mb-2">
        <div class="d-flex justify-content-end">
            <div class="btn-group dropdown-icon-wrapper me-1 mb-1">
                <a href="{{ route('realisasi_rpd.read', ['bulan' => $bulan, 'unit' => $unit, 'print' => '1']) }}" class="btn btn-success"><span class="bi bi-printer"></span> Print</a>
                <button type="button" class="btn btn-primary">
                    <span class="bi bi-calendar-date"></span>
                    Bulan
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ (new Help)->bulan($bulan) }}
                </button>
                <div class="dropdown-menu">
                    @foreach ((new Help)->listbulan() as $idB => $nmB)
                    <a href="{{ route('realisasi_rpd.read', ['bulan' => $idB]) }}" class="dropdown-item">
                        {{ $nmB }}
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Data Realisasi Rencana Penarikan Dana Bulan {{ (new Help)->bulan($bulan) }}</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <form action="{{ route('kegiatan_rpd.migrate-next-month.store') }}" method="POST" id="migrateRpd">
                        @csrf
                        {{ Form::hidden('bulan', $bulan) }}
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered ">
                                <thead>
                                    <tr class="table-dark">
                                        <td rowspan="2">#</td>
                                        <td rowspan="2" class="text-center">Nomor</td>
                                        <td rowspan="2" class="text-center">Nama Kegiatan</td>
                                        <td rowspan="2" class="text-center">Kode Anggaran</td>
                                        <td colspan="2" class="text-center">RPD</td>
                                        <td colspan="2" class="text-center">Realisasi</td>
                                        <td colspan="2" class="text-center">Sisa Dana</td>
                                    </tr>
                                    <tr class="table-dark">
                                        <td class="text-center">LS</td>
                                        <td class="text-center">UP</td>
                                        <td class="text-center">LS</td>
                                        <td class="text-center">UP</td>
                                        <td class="text-center">LS</td>
                                        <td class="text-center">UP</td>
                                    </tr>
                                    <tr class="table-dark">
                                        <td>#</td>
                                        @for ($i = 1; $i < 10; $i++)
                                        <td class="text-center">{{ $i }}</td>
                                        @endfor
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#</td>
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
                                        <td>
                                            <div class="form-check">
                                                <div class="checkbox">
                                                    <input type="checkbox" class="form-check-input" name="rpd[{{ $r->id_rpd }}]" value="1" id="rpd-{{ $r->id_rpd }}">
                                                    <label for="rpd-{{ $r->id_rpd }}"></label>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{{ $r->bulan_rpd.'.'.$r->unit_asli.'.'.$r->nomor }}</td>
                                        <td>{{ $r->nm_kegiatan }}</td>
                                        <td class="text-right">{!! implode('<br>', explode(',', $r->kd_anggaran)) !!}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($r->ls) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($r->up) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($real_ls) }}</td>
                                        <td class="text-right">
                                            T: {{ (new Help)->formatNumber($real_up_tunai) }}<br>
                                            NT: {{ (new Help)->formatNumber($real_up_non) }}
                                        </td>
                                        <td class="text-right">{{ (new Help)->formatNumber($sisa_ls) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($sisa_up) }}</td>
                                    </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="2">
                                            {!! (new BApp)->btnConfirm('Transfer', '', 'Apakah Anda yakin ingin menduplikasi kegiatan terpilih ke bulan depan?', 'btn-sm', 'doTransfer') !!}
                                        </td>
                                        <td colspan="2" class="text-right"><strong>TOTAL</strong></td>
                                        <td class="text-right">{{ (new Help)->formatNumber($data['kegiatan']->sum('ls')) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($data['kegiatan']->sum('up')) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($sum_real_ls) }}</td>
                                        <td class="text-right">
                                            T: {{ (new Help)->formatNumber($sum_real_up_tunai) }}<br>
                                            NT: {{ (new Help)->formatNumber($sum_real_up_non) }}
                                        </td>
                                        <td class="text-right">{{ (new Help)->formatNumber($sum_sisa_ls) }}</td>
                                        <td class="text-right">{{ (new Help)->formatNumber($sum_sisa_up) }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection


@section('extra-js')
<script>
    function doTransfer()
    {
        document.getElementById('migrateRpd').submit();
    }
</script>
@endsection
