@extends('layouts.be-dashboard')

@section('title')
Promo
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Promo' }}
@endsection

@section('header-desc')
{!! 'Manajemen Promo Layanan' !!}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Promo' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Daftar Data Promo</h4>
                <span class="pull-right">
                    <a href="{{ route('p-promo.create') }}" class="btn btn-outline-primary">Tambah Promo</a>
                </span>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td width="5%">#</td>
                                    <td>Nama Promo</td>
                                    <td>Deskripsi</td>
                                    <td>Gambar</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($data) == 0)
                                    <tr>
                                        <td colspan="5" class="text-center"><i>Belum ada data</i></td>
                                    </tr>
                                @else
                                    @php
                                        $n = 1;
                                    @endphp
                                    @foreach ($data as $r)
                                        <tr>
                                            <td>{{ $n++ }}</td>
                                            <td>{{ $r->nm_promo }}</td>
                                            <td>{{ $r->desc_promo }}</td>
                                            <td>
                                                <img src="{{ (new Help)->imageUrl($r->img_promo) }}" alt="{{ 'Gambar untuk '.$r->nm_promo }}" height="75px">
                                            </td>
                                            <td>
                                                {!! (new BApp)->btnAkses('p-promo', $r->id_promo, ['validate'], 'btn-sm') !!}
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
