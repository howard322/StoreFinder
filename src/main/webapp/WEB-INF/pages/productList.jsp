<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>

<div class="panel panel-success">
    <div class="panel-heading">
        <h1 class="panel-title">Product List</h1>
    </div>
    <div class="panel-body">
        <c:if test="${not empty message}">
            <div class="green" style="margin-bottom: 10px">${message}</div>
        </c:if>
        <c:choose>
            <c:when test="${empty products}">
                <h4 class="text-center">No Products</h4>
            </c:when>
            <c:otherwise>
                <div class="row" style="margin-left: 10px">
                    <c:forEach items="${products}" var="product">
                        <div class="col-md-2 text-center" style="margin-left: 10px">
                            <img src="data:image/jpeg;base64,${product.content}" width="100" height="100" alt="${product.name}">
                                <h5><b>${product.name}</b></h5>
                                <h5>Type: ${product.type}</h5>
                                <h5>Price: ${product.price}</h5>
                                <h5>Status: ${product.status}</h5>
                            <div class="btn-group">
                                <form:form action="product-delete" method="post">
                                    <c:if test="${product.status == 'NEW' || product.status == 'APPROVED'}">
                                        <a class="btn btn-primary btn-xs" href="/product-update?id=${product.id}" role="button">Edit</a>
                                    </c:if>
                                    <c:if test="${product.status == 'EXPIRED' || product.status == 'REJECTED'}">
                                        <a class="btn btn-primary btn-xs" disabled="true" href="/product-update?id=${product.id}" role="button">Edit</a>
                                    </c:if>
                                    <c:if test="${product.status == 'NEW'}">
                                        <input type="hidden" value="${product.id}" name="id"/>
                                        <input type="submit" class="btn btn-danger btn-xs"
                                                       onclick="return confirm('Are you sure you want to delete?')" value="Delete"/>
                                    </c:if>
                                </form:form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
        <p><a class="btn btn-primary btn-md" href="/product-create" role="button">Add Product</a></p>
    </div>

</div>

<%@ include file = "/WEB-INF/includes/footer.jsp" %>