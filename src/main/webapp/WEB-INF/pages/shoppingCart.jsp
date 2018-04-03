<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "/WEB-INF/includes/header.jsp" %>
<<style>
<!--

-->
</style>
	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Grocery!</h1>
				<p>Check out now.</p>
			</div>

			<a class="btn btn-primary" href="signup">Signup » </a> <a
				class="btn btn-primary" href="login">Login » </a>
		</div>

	<div class="col-lg-12">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-11">
						<h1>Shopping Cart</h1>
						<span id="menuItems" style="display:none;">${items}</span>
						<div class="panel panel-default">
						  <!-- Default panel contents -->
						  <div class="panel-heading">
						  <div class="row">
						  <div class="container">
						  <div class="col-md-6">
						  		<h3>Total: <span class="label label-primary"><fmt:formatNumber type="number" minFractionDigits="2" value="${total}" /></span>
						  		</h3>
						  </div>
						  	<div style="float: right !important;">
						  		<a id="customerCheckout" class="btn btn-primary btn-lg" href="#" role="button">Proceed to Checkout</a>
						  	</div> 
						  	</div>
						  </div>
						  </div>
						
						  <!-- Table -->
						  <table class="table">
						    <thead>
						    	<th class="col-md-5" colspan="2">Product</th>
						    	<th class="col-md-2"></th>
						    	<th class="col-md-1.5">Price</th>
						    	<th class="col-md-1.5">Quantity</th>
						    	<th class="col-md-2">Sub-total</th>
						    </thead>
						    <tbody>
								<c:forEach items="${products}" var="product">
							    	<tr id="checkitem-${product.product_id}">
							    		<td rowspan="2"><img style="height: 80px; width: 80px" src="assets/img/products/${product.name}.jpg" alt="${product.name}"></td>
							    		<td>${product.name}</td>
							    		<td></td>
							    		<td rowspan="2"><fmt:formatNumber type="number" minFractionDigits="2" value="${product.price}" /></td>
							    		<td rowspan="2">${product.qty}</td>
							    		<td rowspan="2"><fmt:formatNumber type="number" minFractionDigits="2" value="${product.subTotal}" /></td>
							    	</tr>
							    	<tr>
							    		<td>${product.description}</td>
							    	</tr>
								</c:forEach>
						    </tbody>
						  </table>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>