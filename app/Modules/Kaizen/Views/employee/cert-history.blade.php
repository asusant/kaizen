@extends('layouts.be-dashboard')

@section('title')
{{ $title }}
@endsection

@section('extra-css')
@if (isset($use_datatable) && $use_datatable)
<link rel="stylesheet" href="{{ asset('vendors/simple-datatables/style.css') }}">
@endif
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
        <div class="d-flex justify-content-end mb-3">
            <span class="pull-right">
                <a href="#" onclick="window.history.back(); event.preventDefault();" class="btn btn-outline-primary">Kembali</a>
            </span>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="row py-4 px-5">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="{{ asset('images/faces/user.png') }}" alt="{{ $employee->full_name }}">
                        </div>
                        <div class="ms-3 name">
                            <h5 class="font-bold">{{ $employee->full_name }}</h5>
                            <h6 class="text-muted mb-0">{{ $employee->nip }}</h6>
                        </div>
                    </div>
                </div>
                <div class="row py-4 px-5">
                    <table class="table table-hover">
                        <tr>
                            <td width="20%">SMR</td>
                            <td>{{ @$data[0]->group }}</td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>{{ $employee->gender }}</td>
                        </tr>
                        <tr>
                            <td>Position Name</td>
                            <td>{{ $employee->position_desc }}</td>
                        </tr>
                        <tr>
                            <td>Jabatan</td>
                            <td>{{ $employee->position_code }}</td>
                        </tr>
                        <tr>
                            <td>Personel Area</td>
                            <td>{{ $employee->personel_area }}</td>
                        </tr>
                        <tr>
                            <td>Age</td>
                            <td>{{ (new BApp)->diffInYear($employee->date_of_birth) }}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Certification History</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover datatable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    @foreach ($table_columns as $tb_col)
                                        <th>{{ $tb_col }}</th>
                                    @endforeach
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($data) > 0)
                                    @php
                                        $no = 1;
                                    @endphp
                                    @foreach ($data as $r)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            @foreach ($table_columns as $db_col => $tb_col)
                                                <td>{{ $r->{$db_col} }}</td>
                                            @endforeach
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="{{ (sizeof($table_columns) + 1) }}" class="text-center"><i>Belum ada data.</i></td>
                                    </tr>
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
@if (isset($use_datatable) && $use_datatable)
<script src="{{ asset('vendors/simple-datatables/simple-datatables.js') }}"></script>
<script>
    // Simple Datatable
    var tables = [].slice.call(document.querySelectorAll('.datatable'))
    var dataTableList = tables.map(function (el) {
        return new simpleDatatables.DataTable(el);
    });
</script>
@endif
@endsection
