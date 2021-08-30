@extends('layouts.be-dashboard')

@section('title')
Validasi Sub Unit
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Validasi RPD Subunit' }}
@endsection

@section('header-desc')
{{ 'Lakukan validasi RPD subunit apabila sudah selesai diinput' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Validasi Subunit' }}</li>
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
                    <a href="{{ route('validasi_unit.read', ['bulan' => $idB]) }}" class="dropdown-item">
                        {{ $nmB }}
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="row match-height mb-2">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Data Validasi Subunit (unit: {{ cache('ref_unit_sikeu')[$unit] }} | {{ (new Help)->bulan($bulan).' '.$tahun }})</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <form action="{{ route('validasi_unit.validate') }}" method="POST" id="validateSubunit">
                        @csrf
                        {{ Form::hidden('bulan', $bulan) }}
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td width="5%">
                                            <div class="form-check">
                                                <div class="checkbox">
                                                    <input type="checkbox" class="form-check-input" onclick="checkAll('validasi[]', this)">
                                                    <label for="checkall"></label>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Sub Unit</td>
                                        <td width="15%">Status</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if (sizeof($data) == 0)
                                        <tr>
                                            <td colspan="3" class="text-center"><i>Belum ada data.</i></td>
                                        </tr>
                                    @else
                                        @foreach ($data as $sub_unit)
                                            <tr>
                                                <td>
                                                    <div class="form-check">
                                                        <div class="checkbox">
                                                            <input type="checkbox" class="form-check-input" name="validasi[]" value="{{ $sub_unit }}" id="validasi-{{ $sub_unit }}" {{ (isset($data_valid[$sub_unit]) && $data_valid[$sub_unit] == 1 ? 'checked' : '') }}>
                                                            <label for="validasi-{{ $sub_unit }}"></label>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>{{ cache('ref_unit_sikeu')[$sub_unit] }}</td>
                                                <td>
                                                    @if (isset($data_valid[$sub_unit]) && $data_valid[$sub_unit] == 1)
                                                        <span class="badge bg-success">Valid</span>
                                                    @else
                                                        <span class="badge bg-danger">Belum Valid</span>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                            </table>
                        </div>
                        {!! (new BApp)->btnConfirm('Ubah Validasi', '', 'Apakah Anda yakin ingin mengubah validasi sub unit terpilih?', 'btn-sm', 'doValidate') !!}
                    </form>
                </div>
            </div>
        </div>
    </div>

    {{-- Validasi RPD --}}
    <div class="row match-height mb-2">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Riwayat Validasi RPD (unit: {{ cache('ref_unit_sikeu')[$unit] }} | {{ (new Help)->bulan($bulan).' '.$tahun }})</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{-- Hanya dapat melakukan ajuan ketika sudah tidak ada ajuan yg belum valid --}}
                    @if (!$valid_rpd->where('sts_valid', '<>', 1)->first())
                        <form action="{{ route('validasi_unit.rpd.validate') }}" method="POST" id="validateRpd" class="mb-3">
                            @csrf
                            {{ Form::hidden('bulan', $bulan) }}
                            <div class="d-flex justify-content-center">
                                {!! (new BApp)->btnConfirm('Ajukan RPD Versi Baru', '', 'Apakah Anda yakin ingin mengajukan RPD versi baru untuk Bulan '.(new Help)->bulan($bulan).'?', 'btn-success', 'doValidateRpd') !!}
                            </div>
                        </form>
                    @endif
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>Bulan</td>
                                    <td>Versi</td>
                                    <td>Status</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($valid_rpd) == 0)
                                    <tr>
                                        <td colspan="4" class="text-center"><i>Belum ada data RPD Valid bulan ini.</i></td>
                                    </tr>
                                @else
                                    @foreach ($valid_rpd as $r)
                                        <tr>
                                            <td>{{ (new Help)->bulan($r->bulan) }}</td>
                                            <td>{{ $r->versi }}</td>
                                            <td>
                                                <span class="badge bg-{{ config('bobb.sts_valid_rpd')[$r->sts_valid][0] }}" data-bs-toggle="tooltip"
                                                    data-bs-placement="top" title="{{ $r->ket_valid }}">{{ config('bobb.sts_valid_rpd')[$r->sts_valid][1] }}</span>
                                                @if ($r->sts_valid == 1)
                                                    <p>Waktu Valid: {{ (new Help)->parseDateTime($r->wkt_valid) }}</p>
                                                @endif
                                            </td>
                                            <td>
                                                @if ($r->sts_valid == 2)
                                                    {!! (new BApp)->btnConfirm('Ajukan Ulang RPD', route('validasi_unit.rpd-revalidate.validate', ['bulan' => $r->bulan, 'versi' => $r->versi]), 'Apakah Anda yakin ingin mengajukan ulang RPD ini?', 'btn-sm') !!}
                                                @endif
                                            </td>
                                        </tr>
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
    function doValidate()
    {
        document.getElementById('validateSubunit').submit();
    }
    function doValidateRpd()
    {
        document.getElementById('validateRpd').submit();
    }
</script>
@endsection
