$(document).ready(function() {

var itemAdder = function (itemName, quantity, itemDesc, itemCode, removeDelete){
	if(quantity !== 0){
		var tr = '<tr data-toggle=\"modal\" data-target=\"#addEntry\" id=\"' + itemCode + '-item\" data-name="' + itemName + '" data-quantity="' + quantity + '" data-id="' + itemCode + '" data-desc="' + itemDesc + '">\n\t<td>' +  itemName + '</td><td><span style="display:none;">'+ itemDesc +'</span></td>\n\t<td>' +  quantity + '</td><td class=\"xCol\"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span><span style="display:none;">'+ itemCode +'</span></td>\n</tr>';
		var tr2 = '<tr data-target=\"#addEntry\" id=\"' + itemCode + '-item\" data-name="' + itemName + '" data-quantity="' + quantity + '" data-id="' + itemCode + '" data-desc="' + itemDesc + '">\n\t<td>' +  itemName + '</td><td><span style="display:none;">'+ itemDesc +'</span></td>\n\t<td>' +  quantity + '</td><td><span style="display:none;" class="glyphicon glyphicon-remove" aria-hidden="true"></span><span style="display:none;">'+ itemCode +'</span></td>\n</tr>';
		if($('#'+itemCode+'-item').length == 0) {
			if(!removeDelete){ $('.list').append(tr).fadeIn('slow'); }
			else { $('.list').append(tr2).fadeIn('slow'); }
		}
		else{
			if(!removeDelete){ $('#'+itemCode+'-item').replaceWith(tr).fadeIn('slow'); }
			else { $('#'+itemCode+'-item').replaceWith(tr2).fadeIn('slow'); }
		} 
	}
};

if($('#menuItems').text() != null || $('#menuItems').text() == ''){
	var menuItem = JSON.parse($('#menuItems').html());
	for(var i in menuItem){
		itemAdder(menuItem[i].Item, menuItem[i].Qty, menuItem[i].Description, 
				menuItem[i].ItemCode, $('#orderList').text() == 'false');
	}
}

$('.addToList').click(function(){
	itemAdder($(this).attr('name'), $('#orderQuantity').val(), $('#description').text(), 
			$('#itemCode').text(), false);
});

$('.list').mouseover(function(){
	$(this).css('cursor', 'pointer');
});

$(".list").delegate("tr", "click", function(e) {
	var dataRow = $(e.currentTarget);
	$('#itemCode').text(dataRow.data("id"));
	$('#itemname').text(dataRow.data("name"));
	$('#description').text(dataRow.data("desc"));
	$('#orderQuantity').text(dataRow.data("quantity"));
});

$(document).on('click','.xCol',function(){
	if (confirm("Remove Item?") == true) {
		$(this).parent().fadeOut();
		$(this).parent().remove();
    } else {
        alert('Cancelled by user.');
    }
});	

$('.itemOpen').click(function(){
	$('#itemCode').text($(this).attr('data-itemid'));
	$('#itemname').text($(this).attr('data-name'));
	$('#description').text($(this).attr('data-desc'));
	$('#addItem').attr('name', $(this).attr('data-name'));
});

$('#searcher').click(function(){
	var table = $('#entries').tableToJSON();
	console.log(table);
	console.log(JSON.stringify(table));
	var tableStr = encodeURI(JSON.stringify(table));
	window.open('searchProduct?items='+tableStr, "_self"); 
});

$('#shop').click(function(){
	var table = $('#entries').tableToJSON();
	console.log(table);
	console.log(JSON.stringify(table));
	var tableStr = encodeURI(JSON.stringify(table));
	window.open('shop?items='+tableStr, "_self"); 
});

$('#customerCheckout').click(function(){
	var table = $('#menuItems').text();
	table = JSON.parse(table);
	console.log(table);
	console.log(JSON.stringify(table));
	var tableStr = encodeURI(JSON.stringify(table));
	window.open('checkout?items='+tableStr, "_self"); 
});

$('input[type=radio][name="paymentMethod"]').click(function(){
	var result = document.querySelector('input[name="paymentMethod"]:checked').value;
	if(result == '1'){
		$('#fullCardNumber').removeAttr('disabled');
		$('#fullExpiry').removeAttr('disabled');
		$('#fullCVC').removeAttr('disabled');
	}
	if(result == '0') {
		$('#fullCardNumber').prop('disabled', true);
		$('#fullExpiry').prop('disabled', true);
		$('#fullCVC').prop('disabled', true);
	}
});

$('input[type=radio][name="acquireMethod"]').change(function(){
	var result = document.querySelector('input[name="acquireMethod"]').value;
	console.log(result);
});

$('#productCheckout').click(function(){

	if($('input[name=storeoption]:checked').val() != null){
		var colIndex = $('input[name=storeoption]:checked').closest('td').index() + 1;
		//$('table[name=productAvailability] tr td:nth-child('+colIndex+')').css("color", "#F00");
	
		var orderList = $('#menuItems').text();
		var ordersJson = JSON.parse(orderList);
		
		$('table[name=productAvailability] tr td:nth-child('+colIndex+')').each(function(){
			//alert($(this).parent().siblings(":first").text());
			var val = $(this).closest('tr').children('td:first').text();
			var index = ordersJson.findIndex(function(item, i){
				  return item.Item === val;
			});
			var price = $(this).html();
			
			if(index != null && index != -1){
				ordersJson[index]['Price'] = price;
			}
		});
		console.log(ordersJson);
		var tableStr = encodeURI(JSON.stringify(ordersJson));
		//alert(tableStr);
		window.open('cart?items='+tableStr, "_self"); 
	} else {
		alert("Please choose which store to order from.");
	}
});

});
