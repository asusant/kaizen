@extends('layouts.be-dashboard')

@section('title')
Kegiatan RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Kegiatan RPD' }}
@endsection

@section('header-desc')
{{ 'Daftar Kegiatan RPD' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="{{ route('kegiatan_rpd.read') }}">Prognosa</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Kegiatan RPD' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Data Kegiatan RPD yang Tidak ada di Prognosa</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td width="5%">#</td>
                                    <td width="10%">Kode</td>
                                    <td>Nama Kegiatan</td>
                                    <td>Bulan</td>
                                    <td>LS</td>
                                    <td>UP</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $total = ['ls'=>0,'up'=>0];
                                @endphp
                                @if (sizeof($data) == 0)
                                    <tr>
                                        <td colspan="7" class="text-center"><i>Belum ada data.</i></td>
                                    </tr>
                                @else
                                    @php
                                        $n = 1;
                                    @endphp
                                    @foreach ($data as $r)
                                        <tr>
                                            @php
                                                $total['ls'] += $r->ls;
                                                $total['up'] += $r->up;
                                            @endphp
                                            <td>{{ $n++ }}</td>
                                            <td>{{ $r->bulan_rpd.'.'.$r->unit_asli.'.'.$r->nomor }}</td>
                                            <td>{{ $r->nm_kegiatan }}</td>
                                            <td>{{ (new Help)->bulan($r->bulan_rpd) }}</td>
                                            <td>{{ (new Help)->formatNumber($r->ls) }}</td>
                                            <td>{{ (new Help)->formatNumber($r->up) }}</td>
                                            <td>
                                                {!! (new BApp)->btnAkses('kegiatan_rpd.rincian', $r->id_rpd, ['update', 'validate'], 'btn-sm') !!}
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4" class="text-center"> J U M L A H </td>
                                    <td>{{ (new Help)->formatNumber($total['ls']) }}</td>
                                    <td>{{ (new Help)->formatNumber($total['up']) }}</td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
