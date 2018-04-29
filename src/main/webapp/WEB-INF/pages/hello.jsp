<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>
	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Welcome to Store Finder PH� ${email}!</h1>
				<p>To fill this out with numerous promotions that are lined
				up with introducing products from different stores.</p>
			</div>

			<a class="btn btn-primary" href="signup">Signup � </a> <a
				class="btn btn-primary" href="login">Login � </a>
		</div>

		<div class="row">
		  	<div class="col-sm-3">
				<div class="jumbotron mp">
				  <h4>Members Area!</h4>
				  <p>...</p>
				  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
				</div>
			</div>
		  	<div class="col-sm-3">
				<div class="jumbotron mp">
				  <h4>Grocery!</h4>
				  <p>...</p>
				  <p><a class="btn btn-primary btn-lg" href="shop" role="button">Learn more</a></p>
				</div>
			</div>
		  	<div class="col-sm-6">
				<div class="jumbotron mp">
				  <h4>Featured Products</h4>
	<c:forEach items="${products}" var="product">
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img style="height: 80px; width: 80px" src="assets/img/products/${product.name}.jpg" alt="${product.name}">
	    </a>
	  </div>
	</c:forEach>				  
				  <p>
					  <c:choose>
					  	<c:when test="${isAdmin}">
							<a class="btn btn-primary btn-lg" href="/product-management" role="button">Product Management</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-primary btn-lg" href="/product-list" role="button">Product List</a>
						</c:otherwise>
					  </c:choose>
				  </p>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>