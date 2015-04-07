<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<c:url value="/orders/records" var="recordsUrl"/>
<c:url value="/orders/create" var="addUrl"/>
<c:url value="/orders/update" var="editUrl"/>
<c:url value="/orders/delete" var="deleteUrl"/>

<html>
<head>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/>
	<link href='<c:url value="/resources/css/bootstrap.min.css"/>' rel="stylesheet"> 
	<link href='<c:url value="/resources/css/jquery-ui.min.css"/>' rel="stylesheet"> 
	<link href='<c:url value="/resources/css/jquery-ui.theme.min.css"/>' rel="stylesheet">
	<link href='<c:url value="/resources/css/jquery-ui.structure.min.css"/>' rel="stylesheet">  
	<script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/custom.js"/>'></script>

	<title>Order Records</title>
	
	<script type='text/javascript'>
	$(function() {
		// init
		urlHolder.records = '${recordsUrl}';
		urlHolder.add = '${addUrl}';
		urlHolder.edit = '${editUrl}';
		urlHolder.del = '${deleteUrl}';
		loadTable();
		
		$('#newBtn').click(function() { 
			toggleForms('new');
			toggleCrudButtons('hide');
		});
		
		$('#editBtn').click(function() { 
			if (hasSelected()) {
				toggleForms('edit');
				toggleCrudButtons('hide');
				fillEditForm();
			}
		});
		
		$('#reloadBtn').click(function() { 
			loadTable();
		});

		$('#deleteBtn').click(function() {
			if (hasSelected()) { 
				submitDeleteRecord();
			}
		});
		
		$('#newForm').submit(function() {
			event.preventDefault();
			submitNewRecord();
		});
		
		$('#editForm').submit(function() {
			event.preventDefault();
			submitUpdateRecord();
		});

		$('#closeNewForm').click(function() { 
			toggleForms('hide'); 
			toggleCrudButtons('show');
		});
		
		$('#closeEditForm').click(function() { 
			toggleForms('hide'); 
			toggleCrudButtons('show');
		});
	});
	</script>
</head>

<body>
	<div id="navback" style="background-color:#fff;width:100%;height:50px;margin-top:-50px"></div>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="opacity:.95">
	    <div class="container">
	        <div class="navbar-header">
	        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar" style="background-color:#fece2f"></span>
	                <span class="icon-bar" style="background-color:#fece2f"></span>
	                <span class="icon-bar" style="background-color:#fece2f"></span>
	            </button>
	            <a class="navbar-brand" href="home.jsp" style="color:#fece2f;margin-top:-5px"><span style="padding-top:4.2px;float:right">JC's One-Stop Auto Shop</span></a>
	        </div>
	        <div id="navbar" class="collapse navbar-collapse">
	            <ul class="nav navbar-nav">
	                <li><a href="home.jsp" style="color:#fece2f">Home</a></li>
	                <li><a href="store.jsp" style="color:#fece2f">Store</a></li>
	                <li class="active"><a href="orders.jsp" style="color:#fff">Orders</a></li>
	                <li><a href="about.jsp" style="color:#fece2f">About</a></li>
	                <li><a href="contact.jsp" style="color:#fece2f">Contact</a></li>
	            </ul>
	        </div>
	    </div>
    </nav>
    
	<h1 id='banner'>Order List</h1>
	<hr/>
	
	<table id='tableOrders'>
		<caption></caption>
		<thead>
			<tr>
				<th></th>
				<th>Order Number</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Part</th>
				<th>Quantity</th>
				<th>Role</th>
			</tr>
		</thead>
	</table>
	
	<div id='controlBar'>
		<input type='button' value='New' id='newBtn' />
		<input type='button' value='Delete' id='deleteBtn' />
		<input type='button' value='Edit' id='editBtn' />
		<input type='button' value='Reload' id='reloadBtn' />
	</div>
	
	<div id='newForm'>
		<form>
  			<fieldset>
				<legend>Create New Order Form</legend>
				<label for='newOrderNo'>Order Number</label><input type='text' id='newOrderNo'/><br/>
				<label for='newFirstName'>First Name</label><input type='text' id='newFirstName'/><br/>
				<label for='newLastName'>Last Name</label><input type='text' id='newLastName'/><br/>
				<label for='newPart'>Part</label><input type='text' id='newPart'/><br/>
				<label for='newQuantity'>Quantity</label><input type='text' id='newQuantity'/><br/>
				<label for='newPrice'>Price</label><input type='text' id='newPrice'/><br/>
  			</fieldset>
			<input type='button' value='Close' id='closeNewForm' />
			<input type='submit' value='Submit'/>
		</form>
	</div>
	
	<div id='editForm'>
		<form>
  			<fieldset>
				<legend>Edit Order Form</legend>
				<input type='hidden' id='editOrderNo'/>
				<label for='editFirstName'>First Name</label><input type='text' id='editFirstName'/><br/>
				<label for='editLastName'>Last Name</label><input type='text' id='editLastName'/><br/>
				<label for='editPart'>Part</label><input type='text' id='newPart'/><br/>
				<label for='editQuantity'>Quantity</label><input type='text' id='newQuantity'/><br/>
				<label for='editPrice'>Price</label><input type='text' id='newQuantity'/><br/>
			</fieldset>
			<input type='button' value='Close' id='closeEditForm' />
			<input type='submit' value='Submit'/>
		</form>
	</div>
	
</body>
</html>