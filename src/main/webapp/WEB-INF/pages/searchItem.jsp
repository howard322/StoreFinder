<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>
<style>
h4 {
	font-weight: bold;
}
.thumbnail img {
	height: 80px;
	width: 80px;
}
</style>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Grocery!</h1>
				<p>Place your orders now</p>
			</div>

			<a class="btn btn-primary" href="signup">Signup » </a> <a
				class="btn btn-primary" href="login">Login » </a>
				<span id="orderList" style="display:none;">false</span>
				<span id="menuItems" style="display:none;">${menuitems}</span>
		</div>

		<div class="row">
		  	<div class="col-sm-4">
				<div class="jumbotron mp">
				  <h4><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Grocery Cart</h4>
<table class="table table-striped table-hover" id="entries">
  <thead>
    <tr>
      <th class="col-md-6">Item</th>
      <th class="col-md-2"><span style="display:none;">Description</span></th>
      <th class="col-md-2">Qty</th>
      <th class="col-md-2"><span style="display:none;">ItemCode</span></th>
    </tr>
  </thead>
  <tbody class="list" id="tbentries">

  </tbody>
</table>

<p><a id="shop" class="btn btn-primary btn-lg" href="#" role="button">Search</a></p>
				</div>
			</div>
		  	<div class="col-sm-8">
				<div class="jumbotron mp">

<div class="panel panel-default">

	  <!-- Default panel contents -->
	  <div class="panel-heading">Product Availability Information</div>

	  <!-- Table -->
	  <table name="productAvailability" class="table">
		<thead>
			<tr>
				<th>Items</th>
				<c:forEach items="${availableStores}" var="availableStores">
					<th>${availableStores}</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${prices}" var="price">
				<tr>
				
				<td>${price.key}</td>
					<c:forEach items="${price.value}" var="itemPrice">
						<td>${itemPrice}</td>
					</c:forEach>
				</tr>
				</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">Total: </td>
			</tr>
			<tr>
				<td>Order</td>
				<c:forEach items="${availableStoresbyId}" var="availableStores">
					<td><label><input type="radio" name="storeoption" value="store_${availableStores}"> </label></td>
				</c:forEach>
			</tr>
		</tfoot>
	  </table>
	</div>
		  <button id="productCheckout" type="button" class="btn btn-primary">Go to Shopping Cart</button>

				</div>
			</div>

		</div>
	</div>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>