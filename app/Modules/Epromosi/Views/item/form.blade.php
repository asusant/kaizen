@extends('layouts.be-dashboard')

@section('title')
Form Produk
@endsection

@section('extra-css')
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
@endsection

@section('header-title')
{{ 'Form Produk' }}
@endsection

@section('header-desc')
{{ 'Form isian data Produk' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="{{ route('p-item.read') }}">Produk</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Form Produk' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Produk</h4>
                <a href="{{ route('p-item.read') }}" class="btn btn-outline-secondary me-1 mb-1">Kembali</a>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{ Form::model($data, ['route' => $form_route, 'class' => 'form form-horizontal', 'enctype' => 'multipart/form-data'] ) }}
                    @csrf
                    <div class="form-body">
                        {{ Form::hidden('id_item', null) }}
                        <div class="row">
                            <div class="col-md-4">
                                <label for="nm_item">Nama Aset/Layanan</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('nm_item', null, ['class' => 'form-control '.($errors->has('nm_item') ? 'is-invalid' : ''), 'placeholder' => 'Laboratorium Komputer A1', 'id' => 'nm_item']) }}
                                    @if ($errors->has('nm_item'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('nm_item')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="id_kategori">Kategori</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::select('id_kategori', $ref_kat, null, ['class' => 'form-select '.($errors->has('id_kategori') ? 'is-invalid' : ''), 'id' => 'id_kategori']) }}
                                    @if ($errors->has('id_kategori'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('id_kategori')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="desc_item">Deskripsi</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::textarea('desc_item', null, ['class' => 'form-control '.($errors->has('desc_item') ? 'is-invalid' : ''), 'placeholder' => 'Laboratorium komputer dengan kapasitas 20 orang', 'id' => 'desc_item']) }}
                                    @if ($errors->has('desc_item'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('desc_item')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="harga">Harga</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('harga', null, ['class' => 'form-control nominal '.($errors->has('harga') ? 'is-invalid' : ''), 'placeholder' => '5,000,000', 'id' => 'harga']) }}
                                    @if ($errors->has('harga'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('harga')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="max_stok">Max. Stok</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::number('max_stok', null, ['class' => 'form-control '.($errors->has('max_stok') ? 'is-invalid' : ''), 'placeholder' => '5', 'id' => 'max_stok']) }}
                                    @if ($errors->has('max_stok'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('max_stok')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="img_item">Gambar Kategori</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::file('img_item[]', ['class' => 'multiple-files-filepond '.($errors->has('img_item') ? 'is-invalid' : ''), 'id' => 'img_item', 'data-allow-reorder' => 'true']) }}
                                    @if ($errors->has('img_item'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('img_item')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-8">
                                {!! (new BApp)->submitBtn('Simpan') !!}
                                <a href="{{ route('sys_menu_group.read') }}" class="btn btn-secondary me-1 mb-1">Batal</a>
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
<script src='https://unpkg.com/filepond-plugin-file-encode/dist/filepond-plugin-file-encode.min.js'></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
    // register desired plugins...
	FilePond.registerPlugin(
        // preview the image file type...
        FilePondPluginImagePreview,
        // encodes the file as base64 data...
        FilePondPluginFileEncode
    );

    // Filepond: Multiple Files
    FilePond.create( document.querySelector('.multiple-files-filepond'), {
        @if(isset($img_items) && sizeof($img_items) > 0)
        files: [
            @foreach($img_items as $img)
                {
                    source: '{{ (new Help)->imageUrl($img->img_item) }}'
                },
            @endforeach
        ],
        @endif
        allowImagePreview: true,
        allowMultiple: true,
        allowFileEncode: true,
        required: false
    });
</script>
@include('components.partial.nominal')
@endsection
