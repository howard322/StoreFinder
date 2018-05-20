<%@ taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>

<div class="container">
    <div class="jumbotron">
        <div>
            <h1>Grocery!</h1>
            <p>Place your orders now</p>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading">
            <h1 class="panel-title">Checkout</h1>
        </div>
        <div class="panel-body col-lg-offset-1">
            <fieldset>
                <form:form method="post" action="checkout-final" modelAttribute="checkoutForm">
                    <div class="form-group row">
                        <label for="nameInput" class="col-sm-2">Name</label>
                        <div class="col-sm-8">
                            <form:input path="name" id="nameInput" type="text" class="form-control" maxlength="255"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="addressInput" class="col-sm-2">Address</label>
                        <div class="col-sm-8">
                            <form:input path="address" id="addressInput" type="text" class="form-control" maxlength="255"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cityInput" class="col-sm-2">City</label>
                        <div class="col-sm-8">
                            <form:select cssClass="form-control" path="cityId" id="cityInput">
                                <form:options items="${locations}" />
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phoneInput" class="col-sm-2">Phone number</label>
                        <div class="col-sm-8">
                            <form:input path="phoneNumber" id="phoneInput" type="text" class="form-control" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="acquireMethod" class="col-sm-2">Acquisition Method</label>
                        <div class="col-sm-8">
                            <label class="radio-inline"><form:radiobutton path="acquireMethod" name="acquireMethod" value="DELIVERY" selected="true"/>Delivery</label>
                            <label class="radio-inline"><form:radiobutton path="acquireMethod" name="acquireMethod" value="STORE_PICKUP"/>Store Pick-up</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="datepicker" class="col-sm-2">Date/Time</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <form:input type="text" class="form-control" path="date" id="datepicker"
                                            placeholder="Date" required="required"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="paymentType" class="col-sm-2">Payment Method</label>
                        <div class="col-sm-8">
                            <label class="radio-inline"><form:radiobutton path="paymentType" name="paymentType" value="CASH" selected="true"/>Cash Payment</label>
                            <label class="radio-inline"><form:radiobutton path="paymentType" name="paymentType" value="CREDIT_CARD"/>Credit Card Payment</label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fullCardNumber" class="col-sm-2">Credit Card Number</label>
                        <div class="col-sm-8">
                            <form:input type="text" class="form-control" path="cardNumber" id="fullCardNumber" placeholder="Valid Card Number" disabled="false" maxlength="20"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fullExpiry" class="col-sm-2">Credit Card Expiry</label>
                        <div class="col-sm-3">
                            <form:input type="text" class="form-control" path="cardExpiry" id="fullExpiry"
                                        placeholder="MM/DD" disabled="false" maxlength="5"/>
                        </div>
                        <label for="fullCvv" class="col-sm-2">Credit Card Verification Value</label>
                        <div class="col-sm-3">
                            <form:input type="text" class="form-control" path="cardCvv" id="fullCvv"
                                        placeholder="CVV" disabled="false" maxlength="3"/>
                        </div>
                    </div>
                    <div class="form-group row col-sm-8">
                        <input type="submit" class="btn btn-success pull-right" value="Place Order Now" onclick="return confirm('Confirm order?')"/>
                    </div>
                </form:form>
            </fieldset>
        </div>
    </div>
</div>
