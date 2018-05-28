<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/includes/header.jsp" %>

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
                    <legend>Store Finder</legend>
                    <c:if test="${not empty message}">
                        <div class="green">${message}</div>
                    </c:if>
                    <c:if test="${not empty errormsg}">
                        <div class="red" style="font-weight: bold; color: red">${errormsg}</div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>
</div>

<%@ include file="/WEB-INF/includes/footer.jsp" %>