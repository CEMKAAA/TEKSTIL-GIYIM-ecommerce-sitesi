<?php use App\Product; ?>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>Ürün</th>
			<th colspan="2">Açıklama</th>
			<th>Miktar/Güncelle</th>
			<th>Birim Fiyatı</th>
			<th>Kategori/Ürün <br>İndirim</th>
			<th>Alt Toplam</th>
		</tr>
	</thead>
	<tbody>
		<?php $total_price = 0; ?>
		@foreach($userCartItems as $item)
		<?php $attrPrice = Product::getDiscountedAttrPrice($item['product_id'],$item['size']); ?>
		<tr>
			<td> <img width="60" src="{{ asset('images/product_images/small/'.$item['product']['main_image']) }}" alt=""/></td>
			<td colspan="2">
				{{ $item['product']['product_name'] }} ({{ $item['product']['product_code'] }})<br/>
				Renk : {{ $item['product']['product_color'] }}<br/>
				Boyut : {{ $item['size'] }}<br/>
			</td>
			<td>
				<div class="input-append">
					<input class="span1" style="max-width:34px" value="{{ $item['quantity'] }}" id="appendedInputButtons" size="16" type="text">
					<button class="btn btnItemUpdate qtyMinus" type="button" data-cartid="{{ $item['id'] }}"><i class="icon-minus"></i>
					</button>
					<button class="btn btnItemUpdate qtyPlus" type="button" data-cartid="{{ $item['id'] }}"><i class="icon-plus"></i></button>
					<button class="btn btn-danger btnItemDelete" type="button" data-cartid="{{ $item['id'] }}"><i class="icon-remove icon-white"></i></button>
				</div>
			</td>
			<td>TL.{{ $attrPrice['product_price'] }}</td>
			<td>TL.{{ $attrPrice['discount'] }}</td>
			<td>TL.{{ $attrPrice['final_price'] * $item['quantity'] }}</td>
		</tr>
		<?php $total_price = $total_price + ($attrPrice['final_price'] * $item['quantity']); ?>
		@endforeach

		<tr>
			<td colspan="6" style="text-align:right">Alt Toplam:	</td>
			<td> TL.{{ $total_price }}</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:right">Alt Toplam:	</td>
			<td> TL.0.00</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:right"><strong>Toplam Tutar (TL.{{ $total_price }} - TL.0) =</strong></td>
			<td class="label label-important" style="display:block"> <strong> TL.{{ $total_price }} </strong></td>
		</tr>
	</tbody>
</table>
