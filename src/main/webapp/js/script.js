// custom java scripts

$(document).ready(function() {

    var itemAdder = function (itemName, quantity, itemDesc, itemCode, removeDelete) {
        if (quantity !== 0) {
            var tr = '<tr data-target=\"#addEntry\" id=\"' + itemCode + '-item\" data-name="' + itemName + '" data-quantity="' + quantity + '" data-id="' + itemCode + '" data-desc="' + itemDesc + '">\n\t<td>' +  itemName + '</td><td><span style="display:none;">'+ itemDesc +'</span></td>\n\t<td>' +  quantity + '</td><td class=\"xCol\"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span><span style="display:none;">'+ itemCode +'</span></td>\n</tr>';
            var tr2 = '<tr data-target=\"#addEntry\" id=\"' + itemCode + '-item\" data-name="' + itemName + '" data-quantity="' + quantity + '" data-id="' + itemCode + '" data-desc="' + itemDesc + '">\n\t<td>' +  itemName + '</td><td><span style="display:none;">'+ itemDesc +'</span></td>\n\t<td>' +  quantity + '</td><td><span style="display:none;" class="glyphicon glyphicon-remove" aria-hidden="true"></span><span style="display:none;">'+ itemCode +'</span></td>\n</tr>';

            if($('#' + itemCode + '-item').length === 0) {
                if (!removeDelete) {
                    $('#tblentries').append(tr).fadeIn('slow');
                } else {
                    $('#tblentries').append(tr2).fadeIn('slow');
                }
            } else {
                if(!removeDelete) {
                    $('#'+itemCode+'-item').replaceWith(tr).fadeIn('slow');
                } else {
                    $('#'+itemCode+'-item').replaceWith(tr2).fadeIn('slow');
                }
            }
        }
    };

    $('#addItem').click(function(){
        var refVal = $('#productRefInputModal').val();
        var refName = $('#productRefInputModal').find(':selected').data('name');
        var quantity = $('#orderQuantityModal').val();

        if (!quantity || quantity <= 0) {
            alert('Quantity must be greater than 0.');
            return;
        }

        if ($('#' + refVal + '-item').length === 0) {
            itemAdder(refName, quantity, "desc", refVal, false);
        } else {
            alert('Item ' + refName + ' is already in the list.');
        }
    });

    $('#tblentries').mouseover(function(){
        $(this).css('cursor', 'pointer');
    });

    $("#tblentries").delegate("tr", "click", function(e) {
        var dataRow = $(e.currentTarget);
        $('#itemCode').text(dataRow.data("id"));
        $('#itemname').text(dataRow.data("name"));
        $('#description').text(dataRow.data("desc"));
        $('#orderQuantity').text(dataRow.data("quantity"));
    });

    $(document).on('click','.xCol',function(){
        if (confirm("Remove Item?") === true) {
            $(this).parent().fadeOut();
            $(this).parent().remove();
        }
    });

    $('.itemOpen').click(function(){
        $('#itemCode').text($(this).attr('data-itemid'));
        $('#itemname').text($(this).attr('data-name'));
        $('#description').text($(this).attr('data-desc'));
        $('#addItem').attr('name', $(this).attr('data-name'));
    });

    $('#productSearch').click(function(e){
        e.preventDefault();
        var table = $('#entries').tableToJSON().map(function (obj) {
            delete obj.Description;
            obj.code = obj.ItemCode;
            obj.name = obj.Item;
            obj.qty = obj.Quantity;
            delete obj.ItemCode;
            delete obj.Item;
            delete obj.Quantity;
            return obj;
        });

        if (table && table.length === 0) {
            alert("Please add items first.");
            return;
        }

        $.ajax({
            url: '/shop-search',
            type: 'POST',
            data: JSON.stringify(table),
            contentType:"application/json; charset=utf-8",
            success: function(response) {
                $('#searchResults').html(response);
            }
        });
    });

    $('input[type=radio][name="paymentType"]').click(function(){
        var result = document.querySelector('input[name="paymentType"]:checked').value;
        if(result === 'CREDIT_CARD'){
            $('#fullCardNumber').removeAttr('disabled');
            $('#fullExpiry').removeAttr('disabled');
            $('#fullCvv').removeAttr('disabled');
        }
        if(result === 'CASH') {
            $('#fullCardNumber').prop('disabled', true);
            $('#fullExpiry').prop('disabled', true);
            $('#fullCvv').prop('disabled', true);
        }
    });

    $("#datepicker").datetimepicker();

});
