@extends('layouts.be-dashboard')

@section('title')
Form Promo
@endsection

@section('extra-css')
<link href="https://unpkg.com/filepond/dist/filepond.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css" rel="stylesheet">
@endsection

@section('header-title')
{{ 'Form Promo' }}
@endsection

@section('header-desc')
{{ 'Form isian data Promo' }}
@endsection

@section('content-header-right')
<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard.read') }}">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="{{ route('p-promo.read') }}">Promo</a></li>
        <li class="breadcrumb-item active" aria-current="page">{{ 'Form Promo' }}</li>
    </ol>
</nav>
@endsection

@section('content')
<section id="basic-horizontal-layouts">
    <div class="row match-height">
        <div class="card">
            <div class="card-header d-flex justify-content-between">
                <h4 class="card-title">Promo</h4>
                <a href="{{ route('p-promo.read') }}" class="btn btn-outline-secondary me-1 mb-1">Kembali</a>
            </div>
            <div class="card-content">
                <div class="card-body">
                    {{ Form::model($data, ['route' => $form_route, 'class' => 'form form-horizontal', 'enctype' => 'multipart/form-data'] ) }}
                    @csrf
                    <div class="form-body">
                        {{ Form::hidden('id_promo', null) }}
                        <div class="row">
                            <div class="col-md-4">
                                <label for="nm_promo">Nama Promo</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::text('nm_promo', null, ['class' => 'form-control '.($errors->has('nm_promo') ? 'is-invalid' : ''), 'placeholder' => 'Layanan Baru "Lab. Bahasa Terpadu"', 'id' => 'nm_promo']) }}
                                    @if ($errors->has('nm_promo'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('nm_promo')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="desc_promo">Deskripsi</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::textarea('desc_promo', null, ['class' => 'form-control '.($errors->has('desc_promo') ? 'is-invalid' : ''), 'placeholder' => 'Lab bahasa terpadu dengan kualitas tertinggi', 'id' => 'desc_promo']) }}
                                    @if ($errors->has('desc_promo'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('desc_promo')) }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="img_promo">Gambar Promo</label>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    {{ Form::file('img_promo', ['class' => 'file-upload '.($errors->has('img_promo') ? 'is-invalid' : ''), 'id' => 'img_promo']) }}
                                    @if ($errors->has('img_promo'))
                                        <div class="invalid-feedback">{{ implode(' | ', $errors->get('img_promo')) }}</div>
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
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script>
    // register desired plugins...
	FilePond.registerPlugin(
        // preview the image file type...
        FilePondPluginImagePreview,
        // encodes the file as base64 data...
        FilePondPluginFileEncode
    );

    // Filepond: Multiple Files
    FilePond.create( document.querySelector('.file-upload'), {
        allowImagePreview: true,
        allowMultiple: false,
        allowFileEncode: true,
        required: false
    });
</script>
@endsection
