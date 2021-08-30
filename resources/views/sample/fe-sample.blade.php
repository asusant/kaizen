@extends('layouts.fe-app')

@section('title')
Dashboard
@endsection

@section('extra-css')
@endsection

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <h4>Kategori</h4>
                @isset($p_kategori)
                    @foreach ($p_kategori as $kat)
                    <div class="card mb-2">
                        <div class="card-body p-2">
                            <a href="#kat-{{ $kat->id_kategori }}" onclick="focusElm('kat-{{ $kat->id_kategori }}')">
                                <div class="d-flex align-items-center">
                                    <div class="avatar">
                                        <img src="{{ (new Help)->imageUrl($kat->img_kategori) }}" alt="{{ $kat->nm_kategori }}">
                                    </div>
                                    <div class="ms-3 name">
                                        <h5 class="font-bold">{{ $kat->nm_kategori }}</h5>
                                        {{-- <h6 class="text-muted mb-0">{{ $kat->desc_kategori }}</h6> --}}
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    @endforeach
                @endisset
            </div>
        </div>
        <div class="col-md-9">
            <div id="headerCarousel" class="carousel slide" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    @isset($p_promo)
                        @foreach ($p_promo as $i => $r)
                            <li data-bs-target="#headerCarousel" data-bs-slide-to="{{ $i }}" @if($i == 0) class="active" @endif></li>
                        @endforeach
                    @endisset
                </ol>
                <div class="carousel-inner">
                    @isset($p_promo)
                        @foreach ($p_promo as $i => $r)
                            <div class="carousel-item @if($i == 0) active @endif">
                                <img src="{{ (new Help)->imageUrl($r->img_promo) }}" class="d-block w-100" alt="Gambar untuk {{ $r->nm_promo }}">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>{{ $r->nm_promo }}</h5>
                                    <p>{{ $r->desc_promo }}</p>
                                </div>
                            </div>
                        @endforeach
                    @endisset
                </div>
                <a class="carousel-control-prev" href="#headerCarousel" role="button"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" href="#headerCarousel" role="button"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>

@isset($p_kategori)
    @foreach ($p_kategori as $kat)
        <section class="jumbotron mt-3" id="kat-{{ $kat->id_kategori }}">
            <div class="container">
                <h2 class="jumbotron-heading">{{ $kat->nm_kategori }}</h2>
                <p class="lead text-muted mb-0">{{ $kat->desc_kategori }}</p>
            </div>
        </section>
        <div class="container">
            <div class="row">
                @foreach ($p_item->where('id_kategori', $kat->id_kategori) as $item)
                    <div class="col-md-2 m-2">
                        <div class="card">
                            <div class="card-content">
                                <div id="carouselKat{{ $kat->id_kategori }}" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        @foreach (explode(';', $item->imgs_item) as $k => $img)
                                            <div class="carousel-item @if($k == 0) active @endif">
                                                <img src="{{ (new Help)->imageUrl($img) }}" class="d-block w-100 h-100" style="max-height: 250px" alt="Image Architecture">
                                            </div>
                                        @endforeach
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselKat{{ $kat->id_kategori }}" role="button"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselKat{{ $kat->id_kategori }}" role="button"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h6>{{ $item->nm_item }}</h6>
                                    <p class="card-text text-danger">
                                        {{ 'Rp '.(new Help)->formatNumber($item->harga) }} ({{ $item->max_stok }})
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @endforeach
@endisset
@endsection
