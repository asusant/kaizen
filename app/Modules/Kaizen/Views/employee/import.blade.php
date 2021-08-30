@extends('layouts.be-dashboard')

@section('title')
{{ $title }}
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ $title }}
@endsection

@section('header-desc')
{!! $subtitle !!}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        @foreach ($breadcrumbs as $nmB => $url)
        <li class="breadcrumb-item"><a href="{{ $url }}">{{ $nmB }}</a></li>
        @endforeach
        <li class="breadcrumb-item active" aria-current="page">{{ $title }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Import {{ $title }} data from File</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{ Form::model([], ['route' => $base_route.'.do-import.create', 'class' => 'form form-horizontal', 'enctype' => 'multipart/form-data'] ) }}
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <label for="{{ 'employee-file' }}">Employee File</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::file('employee-file', ['class' => 'form-control', 'id' => 'employee-file']) }}
                                    <p><small>{!! 'Upload employee file with given format. <code><a href="'.asset('templates/employee-template.xlsx').'">Download Here</a></code>' !!}</small></p>
                                    @if ($errors->has('employee-file'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('employee-file')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                            <div class="col-md-8">
                                {!! (new BApp)->submitBtn('Simpan') !!}
                                <a href="{{ route($base_route.'.read', $route_params) }}" class="btn btn-secondary me-1 mb-1">Batal</a>
                            </div>
                        </div>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('extra-js')
@endsection
