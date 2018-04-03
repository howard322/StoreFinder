<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file = "/WEB-INF/includes/header.jsp" %>

	<script src="jquery-1.8.3.js">
	</script>
	<script src="bootstrap/js/bootstrap.js">
	</script>
	<script src="datepicker/js/bootstrap-datepicker.js">
	</script>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Store Finder PH Signup</h1>
				<p>Its absolutely quick!</p>
			</div>
		</div>

		<div></div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form:form name="signupform" id="signupForm" class="bs-example form-horizontal" action="register" method="post" commandName="newUser">
							<fieldset>
								<legend>Signup Form</legend>
								<c:if test="${not empty message}">
									<div class="green">${message}</div>
								</c:if>
								<c:if test="${not empty errormsg}">
									<div class="red" style="font-weight: bold; color: red">${errormsg}</div>
								</c:if>
								<div class="form-group">
									<label for="userNameInput" class="col-lg-3 control-label">User
										Name</label>
									<div class="col-lg-9">
										<form:input path="username" class="form-control" id="userNameInput" placeholder="User Name"/>
									</div>
								</div>

								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-9">
										<form:input type="password" class="form-control"
											path="password" id="passwordInput" placeholder="Password" />
									</div>
								</div>

								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Confirm Password</label>
									<div class="col-lg-9">
										<form:input type="password" class="form-control"
											path="passwordConf" id="passwordConfInput" placeholder="Password" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="firstNameInput" class="col-lg-3 control-label">Name</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control" path="name"
											id="nameInput" placeholder="Full Name" />
									</div>
								</div>

								<div class="form-group">
									<label for="dateOfBirthInput" class="col-lg-3 control-label">City</label>
									<div class="col-lg-9">
										<form:select style="font: inherit; height: 40px;" class="form-control" id="fullCity" path="city">
											<c:forEach var="city" items="${cities}">
												<option value="${city.loc_id}">${city.name}</option>
											</c:forEach>
										</form:select>
									</div>
								</div>

								<div class="form-group">
									<label for="emailAddressInput" class="col-lg-3 control-label">Email
										Address</label>
									<div class="col-lg-9">
										<form:input type="text" class="form-control"
											path="email" id="emailAddressInput"
											placeholder="Email Address" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="type" class="col-lg-3 control-label">Buyer / Seller</label>
									<div class="col-lg-9">
										<form name="type" id="type" class="form-control">	
										<input type="radio" name="type" value="BUYER">Buyer
									    <br>
										<input type="radio" name="type" value="SELLER">Seller
										<%
										 String type = request.getParameter("type");
										%>
										</form>
									</div>
								</div>
								
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>

									<!-- <button class="btn btn-primary" data-toggle="modal"
										data-target="#themodal">Submit</button> -->
										
									<input type="submit" value="Submit" id="yesbutton" onclick="submitForm()"
														class="btn btn-primary" data-loading-text="Saving.."
														data-complete-text="Saved!">					
									<div id="themodal" class="modal fade" data-backdrop="static">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h3>Signup Form Submission</h3>
												</div>
												<div class="modal-body">
													<p>Are you sure you want to do this?</p>
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

	<script>
		$(function() {
			$('#dateOfBirthInput').datepicker();
		});
	</script>

	<script>
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};
				setTimeout(countDown, 100);
			});

		});
	</script>

<%@ include file = "/WEB-INF/includes/footer.jsp" %>