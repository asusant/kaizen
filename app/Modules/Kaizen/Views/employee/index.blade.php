@extends('layouts.be-dashboard')

@section('title')
{{ $title }}
@endsection

@section('extra-css')
@if (isset($use_datatable) && $use_datatable)
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.0/datatables.min.css"/>
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
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">List {{ $title }} {!! $add_title !!}</h4>
                <span class="pull-right">
                    {!! $add_header_right !!}
                    @if (config('bobb.akses')['a_create'] == 1)
                    <a href="{{ route($base_route.'.create', $route_params) }}" class="btn btn-outline-primary">Tambah {{ $title }}</a>
                    @endif
                </span>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover datatable">
                            <thead>
                                <tr>
                                    @foreach ($table_columns as $tb_col)
                                        <th>{{ $tb_col }}</th>
                                    @endforeach
                                    <th width="17%">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
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
<script src="{{ asset('vendors/jquery/jquery.min.js') }}" ></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.0/datatables.min.js"></script>
<script>
    $(function () {
        var table = $('.datatable').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ route($base_route.'.data.read') }}",
            columns: [
                @foreach ($table_columns as $k => $v)
                {data: '{{ $k }}', name: '{{ $k }}'},
                @endforeach
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                }
            ]
        });

    });
</script>
@endsection
