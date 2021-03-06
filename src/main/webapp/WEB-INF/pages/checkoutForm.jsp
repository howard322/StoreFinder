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
                            <form:input path="name" id="nameInput" type="text" class="form-control" maxlength="255" required="required"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="addressInput" class="col-sm-2">Address</label>
                        <div class="col-sm-8">
                            <form:input path="address" id="addressInput" type="text" class="form-control" maxlength="255" required="required"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="cityInput" class="col-sm-2">City</label>
                        <div class="col-sm-8">
                            <form:select cssClass="form-control" path="cityId" id="cityInput" required="required">
                                <form:options items="${locations}" />
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phoneInput" class="col-sm-2">Phone number</label>
                        <div class="col-sm-8">
                            <form:input path="phoneNumber" id="phoneInput" type="text" class="form-control" maxlength="20" required="required"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="acquireMethod" class="col-sm-2">Acquisition Method</label>
                        <div class="col-sm-8">
                            <label class="radio-inline"><form:radiobutton path="acquireMethod" name="acquireMethod" value="DELIVERY" required="required"/>Delivery</label>
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
                    <div class="form-group row col-sm-10">
                        <form:input path="total" value="${preCheckoutForm.total}" type="hidden"/>
                        <form:input path="storeId" value="${preCheckoutForm.storeId}" type="hidden"/>
                        <c:forEach var="item" items="${preCheckoutForm.checkoutItems}" varStatus="i">
                            <form:input path="checkoutItems[${i.index}].itemId" value="${item.itemId}" type="hidden"/>
                            <form:input path="checkoutItems[${i.index}].qty" value="${item.qty}" type="hidden"/>
                        </c:forEach>
                        <div class="pull-right btn-group">
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#viewItems">View Items</button>
                            <input type="submit" class="btn btn-success" style="margin-left: 10px" value="Place Order Now" onclick="return confirm('Confirm order?')"/>
                            <div id="viewItems" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Checkout Items (${checkoutItemsSummary.storeName})</h4>
                                        </div>
                                        <div class="modal-body">
                                            <h4><b>Total:</b> ${checkoutItemsSummary.total}</h4>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                <tr>
                                                    <th style="width: 30%"></th>
                                                    <th style="width: 20%">Product</th>
                                                    <th style="width: 20%">Details</th>
                                                    <th style="width: 10%">Price</th>
                                                    <th style="width: 10%">Quantity</th>
                                                    <th style="width: 10%">Subtotal</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${checkoutItemsSummary.selectedProducts}" var="selectProduct">
                                                    <tr>
                                                        <td><img src="data:image/jpeg;base64,${selectProduct.content}" width="70" height="70"></td>
                                                        <td>${selectProduct.productName}</td>
                                                        <td>${selectProduct.productDetails}</td>
                                                        <td>${selectProduct.price}</td>
                                                        <td>${selectProduct.qty}</td>
                                                        <td><b>${selectProduct.totalPrice}<b></b></td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </fieldset>
        </div>
    </div>
</div>
