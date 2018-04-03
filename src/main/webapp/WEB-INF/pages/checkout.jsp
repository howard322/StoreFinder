<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "/WEB-INF/includes/header.jsp" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" charset="utf-8"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js" charset="utf-8"></script>


<script>
    $(document).ready($(function(){
        $("#datepicker").datepicker();
      });
    });
</script>
	
	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Grocery!</h1>
				<p>Check out now.</p>
			</div>

			<a class="btn btn-primary" href="signup">Signup » </a> <a
				class="btn btn-primary" href="login">Login » </a>
				<span id="menuItems" style="display:none;">[${menuitems}]</span>
		</div>
	</div>
	
	<c:if test="${not empty message}">
		<div class="message green">${message}</div>
	</c:if>
	<c:if test="${not empty errormsg}">
		<div class="message red">${errormsg}</div>
	</c:if>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
				
					<div class="col-lg-6">
						<form:form name="checkoutDetails" id="checkoutDetails" method="post" class="bs-example form-horizontal" action="checkoutOrders?items=${items}" commandName="newCheckout">
							<fieldset>
								<legend>Checkout</legend>

								<div class="form-group">
									<label for="fullName" class="col-lg-3 control-label">Name</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="name"
											id="fullName" placeholder="Full Name" value="${user.name}" 
											required="required"/>
									</div>
								</div>

								<div class="form-group">
									<label for="fullAddress" class="col-lg-3 control-label">Address</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="address"
											id="fullAddress" placeholder="Address" required="required" />
									</div>
								</div>

								<div class="form-group">
									<label for="fullCity" class="col-lg-3 control-label">City</label>
									<div class="col-lg-9">
										<form:select style="font: inherit; height: 40px;" class="form-control" id="fullCity" path="city">
											<c:forEach var="city" items="${cities}">
												<option value="${city.loc_id}">${city.name}</option>
											</c:forEach>
										</form:select>
									</div>
								</div>

								<div class="form-group">
									<label for="fullNumber" class="col-lg-3 control-label">Phone Number</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control"											
											path="number" id="fullNumber"
											placeholder="Phone Number" required="required"/>
									</div>
								</div>

								<div class="form-group">
									<label for="acquireMethod" class="col-lg-3 control-label">Acquisition Method</label>
									<div class="col-lg-9">
										<label class="radio-inline"><form:radiobutton path="acquireMethod" name="acquireMethod" value="1"/>Delivery</label>
										<label class="radio-inline"><form:radiobutton path="acquireMethod" name="acquireMethod" value="0"/>Store Pick-up</label>
									</div>
								</div>

								<div class="form-group">
									<label for="datepicker" class="col-lg-3 control-label">Date/Time</label>
									<div class="col-lg-9">
										<div class="input-group date" data-provide="datepicker">
										<form:input type="text" class="form-control"											
											path="date" id="datepicker"
											placeholder="Date" required="required"/>
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</div>
										</div>
										<br>
										<form:input type="text" class="form-control"											
											path="time" id="fullNumber"
											placeholder="Time" required="required"/>
									</div>
								</div>

								<div class="form-group">
									<label for="paymentMethod" class="col-lg-3 control-label">Payment Method</label>
									<div class="col-lg-9">
										<label class="radio-inline"><form:radiobutton path="paymentMethod" name="paymentMethod" value="0" selected="true"/>Cash Payment</label>
										<label class="radio-inline"><form:radiobutton path="paymentMethod" name="paymentMethod" value="1"/>Credit Card Payment</label>
									</div>
								</div>
								
								<div class="form-group">
									<label for="fullCardNumber" class="col-lg-3 control-label">Credit Card Number</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="cardNumber" id="fullCardNumber" placeholder="Valid Card Number" disabled="false"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="fullExpiry" class="col-lg-3 control-label">Credit Card Expiry</label>
									<div class="col-lg-3">
										<form:input type="text" class="form-control"											
											path="cardExpiry" id="fullExpiry"
											placeholder="MM/DD" disabled="false"/>
									</div>
									<div class="col-lg-2">
										<form:input type="text" class="form-control"											
											path="cardCVC" id="fullCVC" value=""
											placeholder="CVC" disabled="false"/>
									</div>
								</div>
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								
								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>

									<button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Place Order Now</button>
									<div id="themodal" class="modal fade" data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>Orders Submission</h3>
												</div>
												<div class="modal-body">
													<p>Place orders now?</p>
													<!--  <div class="progress progress-striped active">
														<div id="doitprogress" class="progress-bar"></div>
													</div>
													-->
												</div>
												<div class="modal-footer">
													<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
													<input type="submit" value="Yes" id="yesbutton"
														class="btn btn-primary" data-loading-text="Saving.."
														data-complete-text="Saved!">
												</div>
											</div>
										</div>
									</div>

								</div>
							</fieldset>
							</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>
<link href="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/theme-default.min.css"
    rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
$.validate({
    validateOnBlur : false, // disable validation when input looses focus
    errorMessagePosition : 'top' // Instead of 'inline' which is default
    scrollToTopOnError : false // Set this property to true on longer forms
  });
</script>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>