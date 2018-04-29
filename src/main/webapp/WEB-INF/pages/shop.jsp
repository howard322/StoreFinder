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

			<a class="btn btn-primary" href="signup">Signup</a> <a
				class="btn btn-primary" href="login">Login</a>
		</div>

		<div class="row">
		  	<div class="col-sm-4">
				<div class="jumbotron mp">
				  <h4><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Grocery Cart</h4>
<span id="orderList" style="display:none;">true</span>
<span id="menuItems" style="display:none;">${menuitems}</span>
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

				<!-- ============= MODAL =============== -->
				<div id="addEntry" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				      <div class="col-md-6">
				      	<h4 class="modal-title pull-left">Add Item</h4>
				      	</div>
				      	<div class="col-md-6">
				        <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
				        </div>
				      </div>
				    <div class="modal-body">
						<div class="form-group">
							          
							<div class="form-group">
							  
							<div class="col-sm-10">
							  <p class="form-control-static">Item ID: <span id="itemCode">0</span></p>
							</div>		
							<p class="form-control-static"></p>
							<div class="panel panel-default">
							  <div class="panel-heading" id="itemname">Description</div>
							  <div id="description" class="panel-body">
								Description test
							  </div>
							</div>
							</div>
							
							<div id="itemmenu" class="form-group">
							
							<label for="btn-quan">Enter Quantity:</label>
							  <input id="orderQuantity" class="form-control" type="number" placeholder="0" min="1" max="99" size="1" height="1" width="2">
							</div>
						</div>
						</div>
						
				      <div class="modal-footer">
				        <button id="addItem" type="button" data-dismiss="modal" name="" class="addToList btn btn-primary">Add</button>
				        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				<!-- ============= END MODAL =============== -->

<p><a id="searcher" class="btn btn-primary btn-lg" href="#" role="button">Search</a></p>
				</div>
			</div>
		  	<div class="col-sm-8">
				<div class="jumbotron mp">
				  <h4>Items List</h4>
<div class="row" style="margin-left: 30px">
  
	<c:forEach items="${products}" var="product">
	  <div class="col-xs-4 col-sm-3" style="margin-right: -20px;">
	    <div class="thumbnail">
	      <img src="assets/img/products/${product.name}.jpg" alt="${product.name}">
	      <div class="caption">
	        <h5 class="text-center">${product.name}</h5>
	        <button type="button" data-itemid="${product.id}" data-name="${product.name}" class="center-block btn btn-primary itemOpen" data-toggle="modal" data-target="#addEntry">Add Item</button>
	      </div>
	    </div>
	  </div>
	</c:forEach>
	
</div>

				</div>
			</div>

		</div>
	</div>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>