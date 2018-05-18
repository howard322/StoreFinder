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
                        <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#cartModal-${productStoreTotal.storeId}">Go To Shopping Cart</button></td>
                        <td><div id="cartModal-${productStoreTotal.storeId}" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Shopping Cart (${productStoreTotal.storeName})</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h4><b>Total:</b> ${productStoreTotal.total}</h4>
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
                                            <c:forEach items="${productStoreTotal.selectedProducts}" var="selectProduct">
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
                                        <button type="button" class="btn btn-success">Checkout</button>
                                    </div>
                                </div>
                            </div>
                        </div></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>