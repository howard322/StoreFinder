<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file = "/WEB-INF/includes/header.jsp" %>

<div class="panel panel-success">
    <div class="panel-body col-lg-offset-3">
            <div class="row">
                <div class="col-lg-6">
                    <form:form method="post" action="product-save" enctype="multipart/form-data" modelAttribute="product">
                        <fieldset>
                            <legend>${mode} Product</legend>
                            <div class="form-group">
                                <label for="nameInput" class="col-lg-3 control-label">Name</label>
                                <div class="col-lg-9">
                                    <form:input path="name" class="form-control" id="nameInput" placeholder="Name" maxlength="15"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="priceInput" class="col-lg-3 control-label">Price</label>
                                <div class="col-lg-9">
                                    <form:input type="number" path="price" class="form-control" id="priceInput"
                                                placeholder="Price" step=".01"/>
                                </div>
                            </div>
                            <div>
                                <label for="priceInput" class="col-lg-3 control-label">Image</label>
                                <input type="file" class="btn" name="fileUpload"/>
                            </div>
                            <div class="col-lg-9">
                                <input type="submit" value="Submit" class="btn btn-primary"/>
                            </div>
                        </fieldset>
                    </form:form>
            </div>
        </div>
    </div>
</div>

<%@ include file = "/WEB-INF/includes/footer.jsp" %>