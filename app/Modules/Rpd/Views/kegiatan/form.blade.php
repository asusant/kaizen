@extends('layouts.be-dashboard')

@section('title')
Form Kegiatan RPD
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Form Kegiatan RPD' }}
@endsection

@section('header-desc')
{{ 'Form isian data kegiatan RPD' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="{{ route('kegiatan_rpd.read') }}">Prognosa</a></li>
        <li class="breadcrumb-item"><a href="{{ route('kegiatan_rpd.rincian.read', ['id' => $prognosa->k_id]) }}">Kegiatan RPD</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Form Kegiatan RPD' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Kegiatan RPD (Prognosa: <code>{{ $prognosa->k_keterangan }}</code>)</h4>
                <a href="{{ route('kegiatan_rpd.rincian.read', ['id' => $prognosa->k_id]) }}" class="btn btn-outline-secondary me-1 mb-1">Kembali</a>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{ Form::model($data, ['route' => $form_route, 'class' => 'form form-horizontal'] ) }}
                    @csrf
                    <div class="form-body">
                        {{ Form::hidden('id_rpd', null) }}
                        {{ Form::hidden('k_id', $prognosa->k_id) }}
                        {{ Form::hidden('unit', $unit->unit_id) }}
                        {{ Form::hidden('unit_asli', $unit_asli) }}
                        <div class="row">
                            <div class="col-md-4">Prognosa</div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text(null, $prognosa->k_keterangan, ['class' => 'form-control', 'disabled' => 'disabled']) }}
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="nm_kegiatan">Nama Kegiatan RPD</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('nm_kegiatan', null, ['class' => 'form-control '.($errors->has('nm_kegiatan') ? 'is-invalid' : ''), 'placeholder' => 'Pembayaran Remunerasi Maret 2022', 'id' => 'nm_kegiatan']) }}
                                    @if ($errors->has('nm_kegiatan'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('nm_kegiatan')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="bulan_rpd">Bulan Kegiatan</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::select('bulan_rpd', (new Help)->listBulan(), null, ['class' => 'form-select '.($errors->has('bulan_rpd') ? 'is-invalid' : ''), 'id' => 'bulan_rpd']) }}
                                    @if ($errors->has('bulan_rpd'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('bulan_rpd')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="ls">Nominal LS</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('ls', null, ['class' => 'form-control nominal '.($errors->has('ls') ? 'is-invalid' : ''), 'placeholder' => '10,000,000', 'id' => 'ls']) }}
                                    @if ($errors->has('ls'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('ls')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="up">Nominal UP</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('up', null, ['class' => 'form-control nominal '.($errors->has('up') ? 'is-invalid' : ''), 'placeholder' => '50,000,000', 'id' => 'up']) }}
                                    @if ($errors->has('up'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('up')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-8">
                                {!! (new BApp)->submitBtn('Simpan') !!}
                                <a href="{{ route('kegiatan_rpd.rincian.read', ['id' => $prognosa->k_id]) }}" class="btn btn-secondary me-1 mb-1">Batal</a>
                            </div>
                        </div>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</section>
@include('components.partial.nominal')
@endsection

@section('extra-js')

@endsection
