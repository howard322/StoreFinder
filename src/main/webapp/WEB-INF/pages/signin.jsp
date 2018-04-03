<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Store Finder PH Login</h1>
				<p>Login to explore the complete features!</p>
			</div>
		</div>

		<div></div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<form name='loginForm' action="<c:url value='/login' />" method='POST'>
							<fieldset>
								<legend>Login</legend>
								<c:if test="${not empty error}">
									<div class="error">${error}<br><br></div>
								</c:if>
								<c:if test="${not empty msg}">
									<div class="green">${msg}<br><br></div>
								</c:if>
								
								<div class="form-group">
									<label for="username" class="col-lg-3 control-label">User
										Name</label>
									<div class="col-lg-9">
										<input name="username" type="text" class="form-control"
											id="userNameInput" placeholder="User Name" />
									</div>
								</div>
								<br><br>
								<div class="form-group">
									<label for="password" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-9">
										<input name="password" type="password" class="form-control"
										 id="passwordInput" placeholder="Password" />
									</div>
								</div>

								<div class="col-lg-9 col-lg-offset-3">
								<br>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<button class="btn btn-default">Cancel</button>
									<button name="submit" type="submit" class="btn btn-primary">Login</button>
								</div>

							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file = "/WEB-INF/includes/footer.jsp" %>