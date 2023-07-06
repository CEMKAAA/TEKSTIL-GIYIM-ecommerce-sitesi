@extends('layouts.admin_layout.admin_layout')
@section('content')

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Kataloglar</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Ana Sayfa</a></li>
              <li class="breadcrumb-item active">Ürünler</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        @if ($errors->any())
          <div class="alert alert-danger" style="margin-top: 10px;">
              <ul>
                  @foreach ($errors->all() as $error)
                      <li>{{ $error }}</li>
                  @endforeach
              </ul>
          </div>
        @endif
        @if(Session::has('success_message'))
          <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top: 10px;">
              {{ Session::get('success_message') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        @endif
        <form name="productForm" id="ProductForm" @if(empty($productdata['id'])) action="{{ url('admin/add-edit-product') }}" @else action="{{ url('admin/add-edit-product/'.$productdata['id']) }}" @endif method="post" enctype="multipart/form-data">@csrf
          <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title">{{ $title }}</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Kategori Seç</label>
                    <select name="category_id" id="category_id" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($categories as $section)
                        <optgroup label="{{ $section['name'] }}"></optgroup>
                        @foreach($section['categories'] as $category)
                          <option value="{{ $category['id'] }}" @if(!empty(@old('category_id')) && $category['id']==@old('category_id')) selected="" @elseif(!empty($productdata['category_id']) && $productdata['category_id']==$category['id']) selected="" @endif>&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;{{ $category['category_name']}}</option>
                          @foreach($category['subcategories'] as $subcategory)
                            <option value="{{ $subcategory['id'] }}" @if(!empty(@old('category_id')) && $subcategory['id']==@old('category_id')) selected="" @elseif(!empty($productdata['category_id']) && $productdata['category_id']==$subcategory['id']) selected="" @endif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp;{{ $subcategory['category_name']}}</option>
                          @endforeach
                        @endforeach
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Marka Seç</label>
                    <select name="brand_id" id="brand_id" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($brands as $brand)
                        <option value="{{ $brand['id'] }}" @if(!empty($productdata['brand_id']) && $productdata['brand_id']==$brand['id']) selected="" @endif>{{ $brand['name'] }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                      <label for="product_name">Ürün Adı</label>
                      <input type="text" class="form-control" name="product_name" id="product_name" placeholder="Enter Product Name" @if(!empty($productdata['product_name'])) value="{{ $productdata['product_name'] }}" @else value="{{ old('product_name') }}" @endif>
                  </div>
                  <div class="form-group">
                      <label for="product_code">Ürün Kodu</label>
                      <input type="text" class="form-control" name="product_code" id="product_code" placeholder="Enter Product Code" @if(!empty($productdata['product_code'])) value="{{ $productdata['product_code'] }}" @else value="{{ old('product_code') }}" @endif>
                  </div>

                </div>
                <div class="col-md-6">
                  <div class="form-group">
                      <label for="product_color">Ürün Rengi</label>
                      <input type="text" class="form-control" name="product_color" id="product_color" placeholder="Enter Product Name" @if(!empty($productdata['product_color'])) value="{{ $productdata['product_color'] }}" @else value="{{ old('product_color') }}" @endif>
                  </div>
                  <div class="form-group">
                      <label for="product_price">Ürün Fiyatı</label>
                      <input type="text" class="form-control" name="product_price" id="product_price" placeholder="Enter Product Price" @if(!empty($productdata['product_price'])) value="{{ $productdata['product_price'] }}" @else value="{{ old('product_price') }}" @endif>
                  </div>
                  <div class="form-group">
                      <label for="product_discount">Ürün İndirimi (%)</label>
                      <input type="text" class="form-control" name="product_discount" id="product_discount" placeholder="Enter Product Discount" @if(!empty($productdata['product_discount'])) value="{{ $productdata['product_discount'] }}" @else value="{{ old('product_discount') }}" @endif>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                      <label for="product_weight">Ürün Ağırlığı</label>
                      <input type="text" class="form-control" name="product_weight" id="product_weight" placeholder="Enter Product Discount" @if(!empty($productdata['product_weight'])) value="{{ $productdata['product_weight'] }}" @else value="{{ old('product_weight') }}" @endif>
                  </div>
                  <div class="form-group">
                      <label for="main_image">Ürün Ana Görseli</label>
                      <div class="input-group">
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="main_image" name="main_image">
                          <label class="custom-file-label" for="main_image">Dosya seç</label>
                        </div>
                        <div class="input-group-append">
                          <span class="input-group-text" id="">Yükle</span>
                        </div>
                      </div>
                      <div>Tavsiye edile görsel boyutu: Genişilk:1000px, Yükseklik:1000px)</div>
                      @if(!empty($productdata['main_image']))
                          <div><img style="width:80px; margin-top: 5px;" src="{{ asset('images/product_images/small/'.$productdata['main_image']) }}">
                          &nbsp;
                          <a class="confirmDelete" href="javascript:void(0)" record="product-image" recordid="{{ $productdata['id'] }}">Görseli Sil</a>
                          </div>
                      @endif
                      <div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                      <label for="product_video">Ürün Videosu</label>
                      <div class="input-group">
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="product_video" name="product_video">
                          <label class="custom-file-label" for="product_video">Dosya Seç</label>
                        </div>
                        <div class="input-group-append">
                          <span class="input-group-text" id="">Yükle</span>
                        </div>
                      </div>
                      @if(!empty($productdata['product_video']))
                        <div><a href="{{ url('videos/product_videos/'.$productdata['product_video']) }}" download>İndir</a>&nbsp;|&nbsp;
                          <a class="confirmDelete" href="javascript:void(0)" record="product-video" recordid="{{ $productdata['id'] }}">Video Sil</a></div>
                      @endif
                  </div>
                  <div class="form-group">
                      <label for="description">Ürün Açıklaması</label>
                      <textarea name="description" id="description" class="form-control" rows="3" placeholder="Enter ...">@if(!empty($productdata['description'])) {{ $productdata['description'] }} @else {{ old('description') }} @endif</textarea>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                      <label for="wash_care">Dikkat edilmesi gerekenler</label>
                      <textarea name="wash_care" id="wash_care" class="form-control" rows="3" placeholder="Enter ...">@if(!empty($productdata['wash_care'])) {{ $productdata['wash_care'] }} @else {{ old('wash_care') }} @endif</textarea>
                  </div>
                  <div class="form-group">
                    <label>Kumaş Seç</label>
                    <select name="fabric" id="fabric" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($fabricArray as $fabric)
                        <option value="{{ $fabric }}" @if(!empty($productdata['fabric']) && $productdata['fabric']==$fabric) selected="" @endif>{{ $fabric }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                    <label>Paça Seç</label>
                    <select name="sleeve" id="sleeve" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($sleeveArray as $sleeve)
                        <option value="{{ $sleeve }}" @if(!empty($productdata['sleeve']) && $productdata['sleeve']==$sleeve) selected="" @endif>{{ $sleeve }}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Desen Seç</label>
                    <select name="pattern" id="pattern" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($patternArray as $pattern)
                        <option value="{{ $pattern }}" @if(!empty($productdata['pattern']) && $productdata['pattern']==$pattern) selected="" @endif>{{ $pattern }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                    <label>Beden Seç</label>
                    <select name="fit" id="fit" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($fitArray as $fit)
                        <option value="{{ $fit }}" @if(!empty($productdata['fit']) && $productdata['fit']==$fit) selected="" @endif>{{ $fit }}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Fırsat Seç</label>
                    <select name="occasion" id="occasion" class="form-control select2" style="width: 100%;">
                      <option value="">Seç</option>
                      @foreach($occasionArray as $occasion)
                        <option value="{{ $occasion }}" @if(!empty($productdata['occasion']) && $productdata['occasion']==$occasion) selected="" @endif>{{ $occasion }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                      <label for="meta_title">Meta Başlık</label>
                      <textarea id="meta_title" name="meta_title" class="form-control" rows="3" placeholder="Enter ...">@if(!empty($productdata['meta_title'])) {{ $productdata['meta_title'] }} @else {{ old('meta_title') }} @endif</textarea>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                      <label for="meta_description">Meta Açıklama</label>
                      <textarea id="meta_description" name="meta_description" class="form-control" rows="3" placeholder="Enter ...">@if(!empty($productdata['meta_description'])) {{ $productdata['meta_description'] }} @else {{ old('meta_description') }} @endif</textarea>
                  </div>
                </div>
                <div class="col-12 col-sm-6">
                  <div class="form-group">
                      <label for="meta_keywords">Meta Anahtar Kelimeler</label>
                      <textarea name="meta_keywords" id="meta_keywords" class="form-control" rows="3" placeholder="Enter ...">@if(!empty($productdata['meta_keywords'])) {{ $productdata['meta_keywords'] }} @else {{ old('meta_keywords') }} @endif</textarea>
                  </div>
                  <div class="form-group">
                      <label for="meta_keywords">Özel Ürün</label>
                      <input type="checkbox" name="is_featured" id="is_featured" value="Yes" @if(!empty($productdata['is_featured']) && $productdata['is_featured']=="Yes") checked="" @endif>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <button type="submit" class="btn btn-primary">Gönder</button>
            </div>
          </div>
        </form>

      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

@endsection
