@extends('layouts.be-dashboard')

@section('title')
Validasi RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Validasi RPD' }}
@endsection

@section('header-desc')
{{ 'Validasi ajuan RPD dari masing-masing unit' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Validasi RPD' }}</li>
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
                    Bulan
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ (new Help)->bulan($bulan) }}
                </button>
                <div class="dropdown-menu">
                    @foreach ((new Help)->listbulan() as $idB => $nmB)
                    <a href="{{ route('validasi_rpd.read', ['bulan' => $idB]) }}" class="dropdown-item">
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
                <h4 class="card-title">Data Validasi RPD ({{ (new Help)->bulan($bulan).' '.$tahun }})</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td width="5%">#</td>
                                    <td>Unit</td>
                                    <td>Versi</td>
                                    <td>Status</td>
                                    <td>RPD Diminta</td>
                                    <td width="20%">Data</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($data) == 0)
                                    <tr>
                                        <td colspan="6" class="text-center"><i>Belum ada data RPD yang siap divalidasi.</i></td>
                                    </tr>
                                @else
                                    @php
                                        $i = 1;
                                    @endphp
                                    @foreach ($data as $kd_unit => $versi)
                                        <tr>
                                            <td>{{ $i++ }}</td>
                                            <td colspan="6">{{ cache('ref_unit_sikeu')[$kd_unit] }}</td>
                                        </tr>
                                        @foreach ($versi as $v)
                                            <tr>
                                                <td colspan="2"></td>
                                                <td>
                                                    <p>Versi {{ $v->versi }}</p>
                                                </td>
                                                <td>
                                                    <span class="badge bg-{{ config('bobb.sts_valid_rpd')[$v->sts_valid][0] }}" data-bs-toggle="tooltip"
                                                        data-bs-placement="top" title="{{ $v->ket_valid }}">{{ config('bobb.sts_valid_rpd')[$v->sts_valid][1] }}</span>
                                                    <p>Waktu Valid: {{ (new Help)->parseDateTime($v->wkt_valid) }}</p>
                                                </td>
                                                <td>
                                                    @if (in_array($v->sts_valid, [1]))
                                                        <code>{{ (new Help)->formatNumber($v->rpd_final) }}</code>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if ($v->sts_valid != 1)
                                                        <a href="{{ route('rincian_rpd.read', ['bulan' => $bulan, 'unit' => $kd_unit]) }}" class="btn btn-primary btn-sm"><span class="bi bi-file-earmark-ruled"></span> RPD</a>
                                                        <a href="{{ route('rincian_rpd.read', ['bulan' => ($bulan - 1), 'unit' => $kd_unit]) }}" class="btn btn-secondary btn-sm"><span class="bi bi-file-earmark-ruled"></span> Realisasi</a>
                                                    @else
                                                        <a href="{{ route('rincian_rpd.read', ['bulan' => $bulan, 'unit' => $kd_unit, 'valid' => 1]) }}" class="btn btn-primary btn-sm"><span class="bi bi-file-earmark-ruled"></span> RPD</a>
                                                        <a href="{{ route('rincian_rpd.read', ['bulan' => ($bulan - 1), 'unit' => $kd_unit, 'valid' => 1]) }}" class="btn btn-secondary btn-sm"><span class="bi bi-file-earmark-ruled"></span> Realisasi</a>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if (in_array($v->sts_valid, [0,2]))
                                                    <div class="btn-group dropup mb-1">
                                                        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <span class="bi bi-check-circle"></span>
                                                            Validasi
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <form class="px-2 py-2" action="{{ route('validasi_rpd.validate') }}" method="POST" id="validateRpd-{{ $v->unit.'-'.$v->versi }}">
                                                                @csrf
                                                                {{ Form::hidden('bulan', $bulan) }}
                                                                {{ Form::hidden('unit', $v->unit) }}
                                                                {{ Form::hidden('versi', $v->versi) }}
                                                                <div class="form-group">
                                                                    <label for="stsValid">Status</label>
                                                                    @foreach (config('bobb.sts_valid_rpd') as $s => $sv)
                                                                    @if ($s == 0)
                                                                        @php continue; @endphp
                                                                    @endif
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio" name="sts_valid" id="stsValid-{{ $s }}" value="{{ $s }}">
                                                                        <label class="form-check-label" for="stsValid-{{ $s }}">
                                                                            {{ $sv[1] }}
                                                                        </label>
                                                                    </div>
                                                                    @endforeach
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="ketValid">Keterangan</label>
                                                                    {{ Form::textarea('ket_valid', $v->ket_valid, ['class' => 'form-control ', 'placeholder' => 'Nominal RPD melebihi Anggaran', 'id' => 'ketValid', 'rows' => '3']) }}
                                                                </div>
                                                                <button type="submit" class="btn btn-secondary me-1 mb-1 btn-submit btn-sm">
                                                                    Simpan
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    @elseif($v->sts_valid == 1 && !$v->is_transfered)
                                                    {!! (new BApp)->btnConfirm('Transfer Pagu', route('validasi_rpd.transfer.validate', ['id_validasi' => $v->id_validasi_rpd]), 'Apakah Anda yakin ingin mentransfer nominal sejumlah Rp '.((new Help)->formatNumber($v->rpd_final)).' sebagai tambahan pagu Transito?', 'btn-sm') !!}
                                                    @elseif($v->is_transfered == 1)
                                                    <span class="badge bg-success" data-bs-toggle="tooltip"
                                                        data-bs-placement="top" title="Waktu Transfer: {{ (new Help)->parseDateTime($v->wkt_transfer) }}">Sudah ditransfer</span>
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

@section('extra-js')
<script>
</script>
@endsection
