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
                        <div class="thumbnail" style="margin-left: 10px">
                            <img src="data:image/jpeg;base64,${product.content}" width="200" height="200" alt="${product.name}">
                            <div class="caption">
                                <h5 class="text-center"><b>${product.name}</b></h5>
                                <h5 class="text-center">Type: ${product.type}</h5>
                                <h5 class="text-center">Price: ${product.price}</h5>
                                <h5 class="text-center">Status: ${product.status}</h5>
                            </div>
                            <c class="form-group">
                                <div class="col-sm-2">
                                    <a class="btn btn-primary btn-sm" href="/product-update?id=${product.id}" role="button">Edit</a>
                                </div>
                                <div class="col-sm-1"></div>
                                <c:if test="${product.status != 'APPROVED'}">
                                    <div class="col-sm-2">
                                        <form:form action="product-delete" method="post">
                                            <input type="hidden" value="${product.id}" name="id"/>
                                            <input type="submit" class="btn btn-danger btn-sm"
                                                   onclick="return confirm('Are you sure you want to delete?')" value="Delete"/>
                                        </form:form>
                                    </div>
                                </c:if>
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