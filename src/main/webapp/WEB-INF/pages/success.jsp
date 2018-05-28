<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/includes/header.jsp" %>

<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">Student Enrollment Login success</h3>
    </div>
    <div class="panel-body">
        <div class="alert alert-dismissable alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Well done!</strong> You successfully logged-into the system.
            Now you can explore the complete features!
        </div>
    </div>
</div>
<div></div>
<div></div>
<a class="btn btn-primary" href="<spring:url value="login.html"/>">Login
    as different user?</a>

<%@ include file="/WEB-INF/includes/footer.jsp" %>