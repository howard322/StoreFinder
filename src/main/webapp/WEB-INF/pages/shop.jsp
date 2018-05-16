<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/includes/header.jsp" %>
<style>
    h4 {
        font-weight: bold;
    }
    .thumbnail img {
        height: 80px;
        width: 80px;
    }
</style>
<div class="container">
    <div class="jumbotron">
        <div>
            <h1>Grocery!</h1>
            <p>Place your orders now</p>
        </div>
    </div>
        <div class="col-sm-4">
            <div class="jumbotron mp">
                <h4><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Grocery Cart</h4>
                <table class="table table-striped table-hover" id="entries">
                    <thead>
                    <tr>
                        <th class="col-md-6">Item</th>
                        <th class="col-md-2"><span style="display:none;">Description</span></th>
                        <th class="col-md-2">Quantity</th>
                        <th class="col-md-2"><span style="display:none;">ItemCode</span></th>
                    </tr>
                    </thead>
                    <tbody class="list" id="tblentries">
                    </tbody>
                </table>

                <!-- ============= MODAL =============== -->
                <div id="addEntry" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="form-group">
                                    <h4 class="modal-title pull-left">Add Item</h4>
                                    <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
                                </div>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="productRefInputModal" class="col-lg-3 control-label">Item</label>
                                    <select class="form-control" id="productRefInputModal">
                                        <option value="NONE" data-name="None" disabled>--Select Product--</option>
                                        <c:forEach items="${productRefs}" var="productRef">
                                            <option value="${productRef.key}" data-name="${productRef.value}">${productRef.value}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="orderQuantityModal" class="col-lg-3 control-label">Quantity</label>
                                    <input id="orderQuantityModal" class="form-control" type="number" step="1" placeholder="0" min="1" max="99">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="addItem" type="button" data-dismiss="modal" class="btn btn-primary">Add</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============= END MODAL =============== -->
                <div class="btn-group">
                    <button class="btn btn-primary btn-md" data-toggle="modal" data-target="#addEntry">Add Item</button>
                    <button id='productSearch' class="btn btn-primary btn-md" style="margin-left: 10px" role="button">Search</button>
                </div>
            </div>
        </div>
        <div id="searchResults" class="col-sm-8"></div>
</div>
<%@ include file = "/WEB-INF/includes/footer.jsp" %>