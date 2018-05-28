<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>

<div class="panel panel-success">
    <div class="panel-heading">
        <h1 class="panel-title">Product Management</h1>
    </div>
    <div class="panel-body" style="margin-left: 10px">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#newProducts" >New Products</a></li>
            <li><a data-toggle="tab" href="#approvedProducts">Approved Products</a></li>
            <li><a data-toggle="tab" href="#rejectedProducts">Rejected Products</a></li>
        </ul>

        <div class="tab-content">
            <div id="newProducts" class="tab-pane fade in active">
                <c:choose>
                    <c:when test="${empty newProducts}">
                        <h4 class="text-center">No New Products</h4>
                    </c:when>
                    <c:otherwise>
                    <div class="row" style="margin-top: 10px">
                        <c:forEach items="${newProducts}" var="product">
                            <div class="col-md-2 text-center" style="margin-left: 10px">
                                <img src="data:image/jpeg;base64,${product.content}" width="100" height="100" alt="${product.name}">
                                <h5><b>${product.name}</b></h5>
                                <h5>Type: ${product.type}</h5>
                                <h5>Price: ${product.price}</h5>
                                <h5>Store: ${product.store}</h5>
                                <div class="btn-group">
                                    <form:form action="product-approve" method="post" cssStyle="float:left; width:auto">
                                        <input type="hidden" value="${product.id}" name="id"/>
                                        <input type="submit" class="btn btn-success btn-xs"
                                               onclick="return confirm('Are you sure you want to approve this product?')" value="Approve"/>
                                    </form:form>
                                    <form:form action="product-reject" method="post" cssStyle="float:left; width:auto; margin-left: 10px">
                                        <input type="hidden" value="${product.id}" name="id"/>
                                        <input type="submit" class="btn btn-danger btn-xs"
                                               onclick="return confirm('Are you sure you want to reject this product?')" value="Reject"/>
                                    </form:form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="approvedProducts" class="tab-pane fade">
                <c:choose>
                    <c:when test="${empty approvedProducts}">
                        <h4 class="text-center">No Approved Products</h4>
                    </c:when>
                    <c:otherwise>
                        <div class="row" style="margin-top: 10px">
                            <c:forEach items="${approvedProducts}" var="product">
                                <div class="col-md-2 text-center" style="margin-left: 10px">
                                    <img src="data:image/jpeg;base64,${product.content}" width="100" height="100" alt="${product.name}">
                                    <h5><b>${product.name}</b></h5>
                                    <h5>Type: ${product.type}</h5>
                                    <h5>Price: ${product.price}</h5>
                                    <h5>Store: ${product.store}</h5>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="rejectedProducts" class="tab-pane fade">
                <c:choose>
                    <c:when test="${empty rejectedProducts}">
                        <h4 class="text-center">No Rejected Products</h4>
                    </c:when>
                    <c:otherwise>
                        <div class="row" style="margin-top: 10px">
                            <c:forEach items="${rejectedProducts}" var="product">
                                <div class="col-md-2 text-center" style="margin-left: 10px">
                                    <img src="data:image/jpeg;base64,${product.content}" width="100" height="100" alt="${product.name}">
                                    <h5><b>${product.name}</b></h5>
                                    <h5>Type: ${product.type}</h5>
                                    <h5>Price: ${product.price}</h5>
                                    <h5>Store: ${product.store}</h5>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%@ include file = "/WEB-INF/includes/footer.jsp" %>