<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/includes/header.jsp" %>

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
                    <form:form name="signupform" id="signupForm" class="bs-example form-horizontal" action="register"
                               method="post" commandName="newUser">
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
                                    <form:input path="username" class="form-control" id="userNameInput"
                                                placeholder="User Name" required="true"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="passwordInput" class="col-lg-3 control-label">Password</label>
                                <div class="col-lg-9">
                                    <form:input type="password" class="form-control"
                                                path="password" id="passwordInput" placeholder="Password" required="true"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="passwordInput" class="col-lg-3 control-label">Confirm Password</label>
                                <div class="col-lg-9">
                                    <form:input type="password" class="form-control"
                                                path="passwordConf" id="passwordConfInput" placeholder="Password" required="true"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="nameInput" class="col-lg-3 control-label">Name</label>
                                <div class="col-lg-9">
                                    <form:input type="text" class="form-control" path="name"
                                                id="nameInput" placeholder="Full Name" required="true"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="fullCity" class="col-lg-3 control-label">City</label>
                                <div class="col-lg-9">
                                    <form:select style="font: inherit; height: 40px;" class="form-control" id="fullCity"
                                                 path="city" required="true">
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
                                                placeholder="Email Address" required="true"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="type" class="col-lg-3 control-label">Buyer / Seller</label>
                                <div class="col-lg-9">
                                    <form name="type" id="type" class="form-control">
                                        <input type="radio" name="type" value="BUYER" required>Buyer
                                        <br>
                                        <input type="radio" name="type" value="SELLER">Seller
                                    </form>
                                </div>
                            </div>

                            <div class="col-lg-9 col-lg-offset-3">
                                <button class="btn btn-default" onclick="window.location.href='/';">Cancel</button>
                                <input type="submit" value="Submit" id="yesbutton" class="btn btn-primary">
                            </div>
                        </fieldset>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/includes/footer.jsp" %>