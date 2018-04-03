<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>» Store Finder PH</title>
<link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://getbootstrap.com/docs/3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/bootstrap-united.css" rel="stylesheet" />
<link href="assets/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="assets/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap-responsive.css" rel="stylesheet" />
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet" /> -->

<link href="<c:url value="datepicker/css/datepicker.css" />" rel="stylesheet" />
<script src="<c:url value="js/jquery/jquery.min.js" />"></script>
<script src="<c:url value="js/jquery/jquery-3.2.1.js" />"></script>
<script src="<c:url value="js/jquery/jquery.tabletojson.min.js" />"></script>
<script src="<c:url value="datepicker/js/bootstrap-datepicker.js" />"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>

<script src="<c:url value="js/jquery/bootstrap-datepicker.js" />"></script>
<script src="<c:url value="js/jquery/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="js/script.js" />"></script>
<style>
body {
	height: 100%;
	margin: 0;
	background: url(assets/img/bg.jpg) fixed;
	background-size: 1440px 800px;
	background-repeat: no-repeat;
	display: compact;
	overflow-x: hidden;
}
.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

.error {
	color: #ff0000;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

.mp {
	padding-top: 20px !important;
	padding-right: 20px !important;
	padding-left: 20px !important;
}
</style>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse">
			<div class="navbar-form navbar-left">
				<h5 style="font-weight: bold; color: white;">STORE FINDER PH©</h5>
			</div>
			
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item active"><a href=".">Home</a></li>
				<sec:authorize access="hasRole('ROLE_USER')">
					<!-- For login user -->
					<c:url value="/logout" var="logoutUrl" />
					<li><form action="${logoutUrl}" method="post" id="logoutForm" style="display:none">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form></li>
					<script>
						function formSubmit() {
							document.getElementById("logoutForm").submit();
						}
					</script>
					<c:choose>
					    <c:when test="${pageContext.request.userPrincipal.name != null}">
					    	<li class="nav-item"><a class="navbar-brand" href="#">User: ${pageContext.request.userPrincipal.name} - ${email}</a></li>
					        <li class="nav-item"><a href="javascript:formSubmit()"> Logout</a></li>
					    </c:when>    
					    <c:otherwise>
							<li class="nav-item"><a href="signup">Signup</a></li>
							<li class="nav-item"><a href="login">Login</a></li>
					    </c:otherwise>
					</c:choose>
				</sec:authorize>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Explore</a>
					<ul class="dropdown-menu">
						<li><a href="#">Contact us</a></li>
						<li class="divider"></li>
						<li><a href="#">Further Actions</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>
	<br><br><br><br>