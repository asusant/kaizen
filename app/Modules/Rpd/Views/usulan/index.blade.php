@extends('layouts.be-dashboard')

@section('title')
Rincian RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Rincian RPD' }}
@endsection

@section('header-desc')
{{ 'Data Rincian RPD' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Rincian RPD' }}</li>
    </ol>
</nav>
@endsection

@section('content')

<section id="basic-horizontal-layouts">
    <div class="row mb-2">
        <div class="d-flex justify-content-end">
            <div class="btn-group dropdown-icon-wrapper me-1 mb-1">
                <a href="{{ route('rincian_rpd.read', ['bulan' => $bulan, 'unit' => $unit, 'valid' => $valid, 'print' => '1']) }}" class="btn btn-success"><span class="bi bi-printer"></span> Print</a>
                <button type="button" class="btn btn-primary">
                    <span class="bi bi-calendar-date"></span>
                    Bulan
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ (new Help)->bulan($bulan) }}
                </button>
                <div class="dropdown-menu">
                    @foreach ((new Help)->listbulan() as $idB => $nmB)
                    <a href="{{ route('rincian_rpd.read', ['bulan' => $idB, 'unit' => $unit, 'valid' => $valid]) }}" class="dropdown-item">
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
                <h4 class="card-title">Data Rincian Rencana Penarikan Dana (unit: {{ cache('ref_unit_sikeu')[$unit].' | Bulan '.(new Help)->bulan($bulan).' '.$tahun }})</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered ">
                            <thead>
                                <tr class="table-dark">
                                    <td rowspan="2" class="text-center">Nomor</td>
                                    <td rowspan="2" class="text-center">Nama Kegiatan</td>
                                    <td rowspan="2" class="text-center">Kode Anggaran</td>
                                    <td colspan="2" class="text-center">RPD</td>
                                </tr>
                                <tr class="table-dark">
                                    <td class="text-center">LS</td>
                                    <td class="text-center">UP</td>
                                </tr>
                                <tr class="table-dark">
                                    @for ($i = 1; $i < 6; $i++)
                                    <td class="text-center">{{ $i }}</td>
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
                                    <td>{{ $r->bulan_rpd.'.'.$r->unit_asli.'.'.$r->nomor }}</td>
                                    <td>{{ $r->nm_kegiatan }}</td>
                                    <td>{!! implode('<br>', explode(',', $r->kd_anggaran)) !!}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($r->ls) }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($r->up) }}</td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td></td>
                                    <td colspan="2" class="text-right"><strong>TOTAL</strong></td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['skrg']['kegiatan']->sum('ls')) }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['skrg']['kegiatan']->sum('up')) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Saldo RPD UP Bulan Lalu</strong></td>
                                    <td class="text-right">{{ '-' }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['lalu']['saldo']) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>BPT Bulan Lalu</strong></td>
                                    <td class="text-right">{{ '-' }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['bpt']) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>RPD yang dimintakan</strong></td>
                                    <td class="text-right">{{ '-' }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['rpd_diminta']) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Total SPP UP/TUP Bulan ini</strong></td>
                                    <td class="text-right">{{ '-' }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['skrg']['total_up']) }}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Kekurangan SPP UP/TUP Bulan Ini</strong></td>
                                    <td class="text-right">{{ '-' }}</td>
                                    <td class="text-right">{{ (new Help)->formatNumber($data['kekurangan_rpd']) }}</td>
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
