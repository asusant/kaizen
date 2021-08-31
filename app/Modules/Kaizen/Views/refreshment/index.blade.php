@extends('layouts.be-dashboard')

@section('title')
{{ $title }}
@endsection

@section('extra-css')
<!-- Include Choices CSS -->
<link rel="stylesheet" href="{{ asset('vendors/choices.js/choices.min.css') }}" />

<link rel="stylesheet" href="{{ asset('vendors/simple-datatables/style.css') }}">
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
                </span>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{ Form::model($filters, ['route' => $base_route.'.create', 'class' => 'form form-horizontal', 'enctype' => 'multipart/form-data', 'id' => 'export-refreshment'] ) }}
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <label for="{{ 'year' }}">Year</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::select('year',
                                        array_combine(
                                            range(date('Y'), date('Y')+10),
                                            range(date('Y'), date('Y')+10)
                                        ),
                                        NULL, ['class' => 'form-control', 'id' => 'year']) }}
                                    @if ($errors->has('year'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('year')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-3 text-right">
                                <label for="{{ 'months' }}">Month(s)</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::select('months[]', $months, NULL, ['class' => 'form-control choices-js-months', 'id' => 'months', 'multiple' => 'multiple']) }}
                                    @if ($errors->has('months'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('months')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-3 text-right">
                                <label for="{{ 'class' }}">Level(s)</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::select('class[]', $cert_class, NULL, ['class' => 'form-control choices-js-levels', 'id' => 'class', 'multiple' => 'multiple']) }}
                                    @if ($errors->has('class'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('class')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                            <div class="col-md-8">
                                {!! (new BApp)->submitBtn('Find') !!}
                            </div>
                        </div>
                    </div>
                    {{ Form::close() }}
                </div>

                @isset($data)
                <div class="row d-flex pull-right">
                    <div class="text-right pe-3">
                        <a href="#" onclick="exportRefreshment()" class="btn btn-success me-1 mb-1"><span class="bi bi-file-excel"></span> Export</a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover datatable" id="datatable">
                        <thead>
                            <tr>
                                <th>NIP</th>
                                <th>Full Name</th>
                                <th>Level / Cert. Class</th>
                                <th>Position Name</th>
                                <th>Personel Area</th>
                                <th>Due Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $dt)
                                <tr>
                                    <td>{{ $dt['employee']->nip }}</td>
                                    <td>{{ $dt['employee']->full_name }}</td>
                                    <td>{{ $dt['last_cert']->group }}</td>
                                    <td>{{ $dt['employee']->position_desc }}</td>
                                    <td>{{ $dt['employee']->personel_area }}</td>
                                    <td>{{ $dt['due_date'] }}</td>
                                    <td>
                                        <a href="{{ route('employee.cert-history.read', ['id' => $dt['employee']->employee_id]) }}" class="btn btn-sm btn-success" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Lihat Data"><span class="bi bi-eye"></span></a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                @endisset
            </div>
        </div>
    </div>
</section>
@endsection

@section('extra-js')
<!-- Include Choices JavaScript -->
<script src="{{ asset('vendors/choices.js/choices.min.js') }}"></script>
<script src="{{ asset('vendors/simple-datatables/simple-datatables.js') }}"></script>
<script>
    function exportRefreshment()
    {
        var form = document.getElementById('export-refreshment');
        form.action = '{{ route($base_route.".create", ["print" => 1]) }}';
        form.submit();
    }

    const csMonths = new Choices('.choices-js-months', {
        removeItems: true,
        removeItemButton: true,
    });

    const csLevels = new Choices('.choices-js-levels', {
        removeItems: true,
        removeItemButton: true,
    });

    // Simple Datatable
    var tables = [].slice.call(document.querySelectorAll('.datatable'));
    var dataTableList = tables.map(function (el) {
        return new simpleDatatables.DataTable(el);
    });
</script>
@endsection
