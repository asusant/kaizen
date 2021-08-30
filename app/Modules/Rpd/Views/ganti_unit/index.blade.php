@extends('layouts.be-dashboard')

@section('title')
Ganti Unit
@endsection

@section('extra-css')
<!-- Include Choices CSS -->
<link rel="stylesheet" href="{{ asset('vendors/choices.js/choices.min.css') }}" />
@endsection

@section('header-title')
{{ 'Ganti Unit / Subunit' }}
@endsection

@section('header-desc')
{{ 'Mengubah unit aktif ke sub unit di bawahnya' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Ganti Unit' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Ganti ke Unit/Subunit lain</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <form class="form form-horizontal" method="POST" action="{{ route('ganti_unit.create') }}">
                        @csrf
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <label for="unit">Pilih Unit</label>
                                </div>
                                <div class="col-md-10">
                                    <div class="form-group has-icon-left">
                                        <div class="position-relative">
                                            {{ Form::select('unit', $list_unit, $unit_aktif, ['class' => 'form-select choices', 'id' => 'unit']) }}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                    {!! (new BApp)->submitBtn('Ganti Unit') !!}
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('extra-js')
<!-- Include Choices JavaScript -->
<script src="{{ asset('vendors/choices.js/choices.min.js') }}"></script>
@endsection
