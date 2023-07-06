@extends('layouts.front_layout.front_layout')
@section('content')
<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Ana Sayfa</a> <span class="divider">/</span></li>
		<li class="active">Sepet</li>
	</ul>
	<h3>  Sepet [ <small>3 Item(s) </small>]<a href="products.html" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Alışverişe Devam </a></h3>
	<hr class="soft"/>
	<table class="table table-bordered">
		<tr><th> Zaten Kaydoldum  </th></tr>
		<tr>
			<td>
				<form class="form-horizontal">
					<div class="control-group">
						<label class="control-label" for="inputUsername">Kullanıcı Adı</label>
						<div class="controls">
							<input type="text" id="inputUsername" placeholder="Username">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword1">Şifre</label>
						<div class="controls">
							<input type="password" id="inputPassword1" placeholder="Password">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">Giriş Yap</button> Ya da <a href="register.html" class="btn">kAYDOL!</a>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<a href="forgetpass.html" style="text-decoration:underline">Şifreni mi unuttun?</a>
						</div>
					</div>
				</form>
			</td>
		</tr>
	</table>
	@if(Session::has('success_message'))
        <div class="alert alert-success" role="alert">
            {{ Session::get('success_message') }}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
    @endif
    @if(Session::has('error_message'))
        <div class="alert alert-danger" role="alert">
            {{ Session::get('error_message') }}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
    @endif

    <div id="AppendCartItems">
		@include('front.products.cart_items')
	</div>

	<table class="table table-bordered">
		<tbody>
			<tr>
				<td>
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label"><strong> Kupon Kodları: </strong> </label>
							<div class="controls">
								<input type="text" class="input-medium" placeholder="CODE">
								<button type="submit" class="btn"> Ekle </button>
							</div>
						</div>
					</form>
				</td>
			</tr>

		</tbody>
	</table>
	<a href="products.html" class="btn btn-large"><i class="icon-arrow-left"></i> Alışverişe Devam </a>
	<a href="login.html" class="btn btn-large pull-right">Sonraki <i class="icon-arrow-right"></i></a>
</div>
@endsection
