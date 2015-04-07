var urlHolder = new Object();

function loadTable() {
	$.get(urlHolder.records, function(response) {
		
 		$('#tableOrders').find('tbody').remove();
 		
 		for (var i=0; i<response.orders.length; i++) {
			var row = '<tr>';
			row += '<td><input type="radio" name="index" id="index" value="'+i+'"></td>';
			row += '<td>' + response.orders[i].orderNo + '</td>';
			row += '<td>' + response.orders[i].firstName + '</td>';
			row += '<td>' + response.orders[i].lastName + '</td>';
			row += '<td>' + response.orders[i].part + '</td>';
			row += '<td>' + response.orders[i].quantity + '</td>';
			row += '<td>' + response.orders[i].price + '</td>';
			row += '</tr>';
	 		$('#tableOrders').append(row);
 		}
 		
 		$('#tableOrders').data('model', response.orders);
		toggleForms('hide'); ;
 	});
}

function submitNewRecord() {
	$.post(urlHolder.add, {
			orderNo: $('#newOrderNo').val(),
			firstName: $('#newFirstName').val(),
			lastName: $('#newLastName').val(),
			part: $('#newPart').val(),
			quantity: $('#newQuantity').val(),
			price: $('#newPrice').val(),
		}, 
		function(response) {
			if (response != null) {
				loadTable();
				toggleForms('hide'); ;
				toggleCrudButtons('show');
				alert('Success! Record has been added.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);	
}

function submitDeleteRecord() {
	var selected = $('input:radio[name=index]:checked').val();
	
	$.post(urlHolder.del, {
			orderNo: $('#tableOrders').data('model')[selected].orderNo
		}, 
		function(response) {
			if (response == true) {
				loadTable(urlHolder.records);
				alert('Success! Record has been deleted.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
}

function submitUpdateRecord() {
	$.post(urlHolder.edit, {
			firstName: $('#editFirstName').val(),
			lastName: $('#editLastName').val(),
			part: $('#editPart').val(),
			quantity: $('#editQuantity').val(),
			price: $('#editPrice').val(),
		}, 
		function(response) {
			if (response != null) {
				loadTable();
				toggleForms('hide'); ;
				toggleCrudButtons('show');
				alert('Success! Record has been edited.');
			} else {
				alert('Failure! An error has occurred!');
			}
		}
	);
}

function hasSelected() {
	var selected = $('input:radio[name=index]:checked').val();
	if (selected == undefined) { 
		alert('Select a record first!');
		return false;
	}
	
	return true;
}

function fillEditForm() {
	var selected = $('input:radio[name=index]:checked').val();
	$('#editFirstName').val( $('#tableOrders').data('model')[selected].firstName );
	$('#editLastName').val( $('#tableOrders').data('model')[selected].lastName );
	$('#editPart').val( $('#tableOrders').data('model')[selected].part );
	$('#editQuantity').val( $('#tableOrders').data('model')[selected].quantity );
	$('#editPrice').val( $('#tableOrders').data('model')[selected].price );
}

function resetNewForm() {
	$('#newOrderNo').val('');
	$('#newFirstName').val('');
	$('#newLastName').val('');
	$('#newPart').val('');
	$('#newQuantity').val('');
	$('#newPrice').val('');
}

function resetEditForm() {
	$('#editFirstName').val('');
	$('#editLastName').val('');
	$('#editPart').val('');
	$('#editQuantity').val('');
	$('#editPrice').val('');
}

function toggleForms(id) {
	if (id == 'hide') {
		$('#newForm').hide();
		$('#editForm').hide();
		
	} else if (id == 'new') {
 		resetNewForm();
 		$('#newForm').show();
 		$('#editForm').hide();
 		
	} else if (id == 'edit') {
 		resetEditForm();
 		$('#newForm').hide();
 		$('#editForm').show();
	}
}

function toggleCrudButtons(id) {
	if (id == 'show') {
		$('#newBtn').removeAttr('disabled');
		$('#editBtn').removeAttr('disabled');
		$('#deleteBtn').removeAttr('disabled');
		$('#reloadBtn').removeAttr('disabled');
		
	} else if (id == 'hide'){
		$('#newBtn').attr('disabled', 'disabled');
		$('#editBtn').attr('disabled', 'disabled');
		$('#deleteBtn').attr('disabled', 'disabled');
		$('#reloadBtn').attr('disabled', 'disabled');
	}
}
