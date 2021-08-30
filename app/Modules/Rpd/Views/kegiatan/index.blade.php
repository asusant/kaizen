@extends('layouts.be-dashboard')

@section('title')
Kegiatan
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Kegiatan Prognosa' }}
@endsection

@section('header-desc')
{{ 'Daftar Kegiatan Prognosa' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Kegiatan' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row mb-2">
        <div class="d-flex justify-content-end">
            <div class="btn-group dropdown-icon-wrapper me-1 mb-1">
                <button type="button" class="btn btn-primary">
                    <span class="bi bi-calendar-date"></span>
                    Filter Bulan
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ ($filter_bulan ? (new Help)->bulan($filter_bulan) : 'Semua Bulan') }}
                </button>
                <div class="dropdown-menu">
                    <a href="{{ route('kegiatan_rpd.read') }}" class="dropdown-item">
                        Semua Bulan
                    </a>
                    @foreach ((new Help)->listbulan() as $idB => $nmB)
                    <a href="{{ route('kegiatan_rpd.read', ['bulan' => $idB]) }}" class="dropdown-item">
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
                <h4 class="card-title">Data Kegiatan Prognosa (Sikeu)</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td width="5%">#</td>
                                    <td>Nama Kegiatan</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($keg_sianggar) == 0)
                                    <tr>
                                        <td colspan="3" class="text-center"><i>Belum ada data.</i></td>
                                    </tr>
                                @else
                                    @foreach ($keg_sianggar as $id => $nm)
                                        <tr>
                                            <td></td>
                                            <td colspan="2"><strong>{{ $nm }}</strong></td>
                                        </tr>
                                        @php
                                            $n = 1;
                                        @endphp
                                        @foreach ($data->where('keg_sianggar_id', $id) as $r)
                                            <tr>
                                                <td>{{ $n++ }}</td>
                                                <td>{{ $r->k_keterangan }}</td>
                                                <td>
                                                    @if (isset($sudah_rpd[$r->k_id]))
                                                    <a href="{{ route('kegiatan_rpd.rincian.read', ['id' => $r->k_id]) }}" class="btn btn-success btn-sm">Keg. RPD ({{ $sudah_rpd[$r->k_id]->n_keg }})</a>
                                                    @else
                                                    <a href="{{ route('kegiatan_rpd.rincian.read', ['id' => $r->k_id]) }}" class="btn btn-primary btn-sm">Keg. RPD</a>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
