@extends('layouts.fe-app')

@section('title')
Dashboard
@endsection

@section('extra-css')
@endsection

@section('content')
<div class="row d-flex justify-content-center" style="height: 500px">
    <section class="jumbotron text-center align-self-center">
        <div class="container">
            <h1 class="jumbotron-heading">{{ cache('sys_setting')['sys_name'] }}</h1>
            <p class="lead text-muted mb-0">{{ cache('sys_setting')['sys_desc'] }}</p>
        </div>
    </section>
</div>

@endsection

@section('extra-js')
@endsection
