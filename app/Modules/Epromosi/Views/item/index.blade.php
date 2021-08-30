@extends('layouts.be-dashboard')

@section('title')
Produk
@endsection

@section('extra-css')
@endsection

@section('header-title')
{{ 'Produk' }}
@endsection

@section('header-desc')
{!! 'Manajemen Item Produk' !!}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Produk' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Daftar Data Produk</h4>
                <span class="pull-right">
                    <a href="{{ route('p-item.create') }}" class="btn btn-outline-primary">Tambah Produk</a>
                </span>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td width="5%">#</td>
                                    <td>Nama Produk</td>
                                    <td>Deskripsi</td>
                                    <td>Kategori</td>
                                    <td>Max. Stok</td>
                                    <td>Harga</td>
                                    <td>Image</td>
                                    <td width="15%">Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($data) == 0)
                                    <tr>
                                        <td colspan="7" class="text-center"><i>Belum ada data</i></td>
                                    </tr>
                                @else
                                    @php
                                        $n = 1;
                                    @endphp
                                    @foreach ($data as $r)
                                        <tr>
                                            <td>{{ $n++ }}</td>
                                            <td>{{ $r->nm_item }}</td>
                                            <td>{{ $r->desc_item }}</td>
                                            <td>{{ $r->nm_kategori }}</td>
                                            <td>{{ $r->max_stok }}</td>
                                            <td>{{ (new Help)->formatNumber($r->harga) }}</td>
                                            <td>
                                                @foreach (explode(';', $r->imgs_item) as $img)
                                                <img src="{{ (new Help)->imageUrl($img) }}" alt="{{ 'Gambar untuk '.$r->nm_item }}" height="50px" class="mr-1">
                                                @endforeach
                                            </td>
                                            <td>
                                                {!! (new BApp)->btnAkses('p-item', $r->id_item, ['validate'], 'btn-sm') !!}
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
