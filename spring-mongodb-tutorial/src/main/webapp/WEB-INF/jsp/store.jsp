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

	<title>Store Page</title>
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
	                <li class="active"><a href="store.jsp" style="color:#fff">Store</a></li>
	                <li><a href="orders.jsp" style="color:#fece2f">Orders</a></li>
	                <li><a href="about.jsp" style="color:#fece2f">About</a></li>
	                <li><a href="contact.jsp" style="color:#fece2f">Contact</a></li>
	            </ul>
	        </div>
	    </div>
    </nav>
	<br/>
	<br/>
	<br/>
	<button>*UNDER CONSTRUCTION*</button>
	<div id="tabs">
		<ul>
			<li><a href="#tab1">Replacement Parts</a></li>
			<li><a href="#tab2">Interior Accessories</a></li>
			<li><a href="#tab3">Exterior Accessories</a></li>
			<li><a href="#tab4">Truck and Towing</a></li>
			<li><a href="#tab5">Tools and Equipment</a></li>
			<li><a href="#tab6">Fluids and Chemicals</a></li>
			<li><a href="#tab7">Performance Products</a></li>
			<li><a href="#tab8">Repair Manuals</a></li>
			<li><a href="#tab9">Today's Deals</a></li>
		</ul>
		<div id="tab1"></div>
		<div id="tab2"></div>
		<div id="tab3"></div>
		<div id="tab4"></div>
		<div id="tab5"></div>
		<div id="tab6"></div>
		<div id="tab7"></div>
		<div id="tab8"></div>
		<div id="tab9"></div>
	</div>
	
	
</body>
</html>