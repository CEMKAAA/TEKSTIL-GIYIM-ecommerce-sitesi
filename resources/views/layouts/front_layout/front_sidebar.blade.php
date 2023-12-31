<?php
use App\Section;
$sections = Section::sections();
/*echo "<pre>"; print_r($sections); die;*/
?>
<div id="sidebar" class="span3">
	<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="{{ asset('images/front_images/ico-cart.png') }}" alt="cart">3 Sepetteki Ürün</a></div>
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		@foreach($sections as $section)
			@if(count($section['categories'])>0)
				<li class="subMenu"><a>{{ $section['name'] }}</a>
					@foreach($section['categories'] as $category)
					<ul>
						<li><a href="{{ url($category['url']) }}"><i class="icon-chevron-right"></i><strong>{{ $category['category_name'] }}</strong></a></li>
						@foreach($category['subcategories'] as $subcategory)
							<li><a href="{{ url($subcategory['url']) }}"><i class="icon-chevron-right"></i>{{ $subcategory['category_name'] }}</a></li>
						@endforeach
					</ul>
					@endforeach
				</li>
			@endif
		@endforeach
	</ul>
	<br>
	@if(isset($page_name) && $page_name=="listing")
		<div class="well well-small">
			<h5>Kumaş</h5>
			@foreach($fabricArray as $fabric)
			 <input class="fabric" style="margin-top: -3px;" type="checkbox" name="fabric[]" id="{{ $fabric }}" value="{{ $fabric }}">&nbsp;&nbsp;{{ $fabric }}<br>
			@endforeach
		</div>
		<div class="well well-small">
			<h5>Paça</h5>
			@foreach($sleeveArray as $sleeve)
			 <input class="sleeve" style="margin-top: -3px;" type="checkbox" name="sleeve[]" id="{{ $sleeve }}" value="{{ $sleeve }}">&nbsp;&nbsp;{{ $sleeve }}<br>
			@endforeach
		</div>
		<div class="well well-small">
			<h5>Desen</h5>
			@foreach($patternArray as $pattern)
			 <input class="pattern" style="margin-top: -3px;" type="checkbox" name="pattern[]" id="{{ $pattern }}" value="{{ $pattern }}">&nbsp;&nbsp;{{ $pattern }}<br>
			@endforeach
		</div>
		<div class="well well-small">
			<h5>Boyut</h5>
			@foreach($fitArray as $fit)
			 <input class="fit" style="margin-top: -3px;" type="checkbox" name="fit[]" id="{{ $fit }}" value="{{ $fit }}">&nbsp;&nbsp;{{ $fit }}<br>
			@endforeach
		</div>
		<div class="well well-small">
			<h5>Fırsat</h5>
			@foreach($occasionArray as $occasion)
			 <input class="occasion" style="margin-top: -3px;" type="checkbox" name="occasion[]" id="{{ $occasion }}" value="{{ $occasion }}">&nbsp;&nbsp;{{ $occasion }}<br>
			@endforeach
		</div>
	@endif
	<br/>
	<div class="thumbnail">
		<img src="{{ asset('images/front_images/payment_methods.png') }}" title="Payment Methods" alt="Payments Methods">
		<div class="caption">
			<h5>Ödeme Yöntemleri</h5>
		</div>
	</div>
</div>
