<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="jumbotron mp">
    <h4>Search Results</h4>
    <div class="row" style="margin-left: 30px">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th style="width: 20%">Item</th>
                    <th style="width: 10%">Quantity</th>
                    <th style="width: 80%">Stores</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productSearchResult.productSearchViews}" var="productSearchView">
                    <tr>
                        <td>${productSearchView.productSearchForm.name}</td>
                        <td>${productSearchView.productSearchForm.qty}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty productSearchView.searchStoreViews}">
                                    <div><b>No store found that carries this item</b></div>
                                </c:when>
                                <c:otherwise>
                                    <ul class="list-unstyled">
                                        <c:forEach items="${productSearchView.searchStoreViews}" var="searchStoreView">
                                            <li><b>${searchStoreView.storeName}:</b> ${searchStoreView.price}</li>
                                        </c:forEach>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <h4>Total</h4>
    <div class="row" style="margin-left: 30px">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th style="width: 20%">Store</th>
                <th style="width: 20%">Total</th>
                <th style="width: 20%">Action</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${productSearchResult.productStoreTotalViews}" var="productStoreTotal">
                    <tr>
                        <td>${productStoreTotal.storeName}</td>
                        <td>${productStoreTotal.total}</td>
                        <td><button class="btn btn-info">Go To Shopping Cart</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>