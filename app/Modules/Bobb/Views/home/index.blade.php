@extends('layouts.be-dashboard')

@section('title')
Dashboard
@endsection

@section('extra-css')
<link rel="stylesheet" href="{{ asset('vendors/iconly/bold.css') }}">
@endsection

@section('header-title')
{{ 'Dashboard' }}
@endsection

@section('header-desc')
{{-- {{ cache('sys_setting')['sys_desc'] }} --}}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">{{ 'Dashboard' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<div class="alert alert-success">
    <h4 class="alert-heading">Selamat datang di {{ cache('sys_setting')['sys_name'] }}</h4>
    <p>
        {{ cache('sys_setting')['sys_desc'] }}
    </p>
</div>

<section class="row">
    <div class="col-12 col-lg-9">
        <div class="row">
            @foreach ($lvl_count as $lvl => $cnt)
                @if($lvl == 'LEVEL 5') @php continue; @endphp  @endif
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon {{ @$lvl_color[$lvl] }}">
                                        <i class="iconly-boldProfile"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">{{ $lvl }}</h6>
                                    <h6 class="font-extrabold mb-0">{{ $cnt }}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Data Sertifikasi per Tahun</h4>
                    </div>
                    <div class="card-body">
                        <div id="chart-cert-per-year"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-lg-3">
        <div class="card">
            <div class="card-body px-3 py-4-5">
                <div class="row">
                    <div class="col-md-4">
                        <div class="stats-icon {{ @$lvl_color["LEVEL 5"] }}">
                            <i class="iconly-boldProfile"></i>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h6 class="text-muted font-semibold">{{ 'LEVEL 5' }}</h6>
                        <h6 class="font-extrabold mb-0">{{ @$lvl_count['LEVEL 5'] }}</h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <h4>Data Kelulusan</h4>
            </div>
            <div class="card-body">
                <div id="chart-cert-pass"></div>
            </div>
        </div>
    </div>
</section>
@endsection

@section('extra-js')
<script src="{{ asset('vendors/apexcharts/apexcharts.js') }}"></script>
<script>

let optionsCertPass  = {
	series: [{{ implode(',', $pass_count) }}],
	labels: [{!! (sizeof($pass_count) > 0 ? "'".implode("','", array_keys($pass_count))."'" : NULL)  !!}],
	colors: ['#435ebe','#55c6e8','#65d6e8'],
	chart: {
		type: 'donut',
		width: '100%',
		height:'350px'
	},
	legend: {
		position: 'bottom'
	},
	plotOptions: {
		pie: {
			donut: {
				size: '30%'
			}
		}
	}
}

var optionsCertPerYear = {
	annotations: {
		position: 'back'
	},
	dataLabels: {
		enabled:false
	},
	chart: {
		type: 'bar',
		height: 300
	},
	fill: {
		opacity:1
	},
	plotOptions: {
	},
	series: [{
		name: 'Certification',
		data: [{{ implode(',', $cert_year) }}]
	}],
	colors: '#435ebe',
	xaxis: {
        categories: [{!! (sizeof($cert_year) > 0 ? "'".implode("','", array_keys($cert_year))."'" : NULL)  !!}],
	},
}

var chartCertPass = new ApexCharts(document.getElementById('chart-cert-pass'), optionsCertPass);
var chartCertPerYear = new ApexCharts(document.getElementById("chart-cert-per-year"), optionsCertPerYear);
chartCertPass.render();
chartCertPerYear.render();
</script>
@endsection
