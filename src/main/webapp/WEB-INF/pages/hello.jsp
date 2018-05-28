<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="jumbotron">
        <div>
            <h1>Welcome to Store Finder PH ${email}!</h1>
            <p>To fill this out with numerous promotions that are lined
                up with introducing products from different stores.</p>
        </div>

        <sec:authorize access="!isAuthenticated()">
            <a class="btn btn-primary" href="signup">Sign-up</a>
            <a class="btn btn-primary" href="login">Login</a>
        </sec:authorize>
    </div>

    <div class="row">
        <div class="col-sm-3">
            <div class="jumbotron mp">
                <h4>Members Area!</h4>
                <p>...</p>
                <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
            </div>
        </div>

        <sec:authorize access="hasRole('ROLE_BUYER')">
            <div class="col-sm-3">
                <div class="jumbotron mp">
                    <h4>Grocery!</h4>
                    <c:choose>
                        <c:when test="${not empty message}">
                            <div class="green" style="font-size: 14px">${message}</div>
                        </c:when>
                        <c:otherwise><p>...</p></c:otherwise>
                    </c:choose>
                    <p><a class="btn btn-primary btn-lg" href="shop" role="button">Learn more</a></p>
                </div>
            </div>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SELLER')">
        <div class="col-sm-6">
            <div class="jumbotron mp">
                <h4>Products</h4>
                <p>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a class="btn btn-primary btn-lg" href="/product-management" role="button">Product
                            Management</a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_SELLER')">
                        <a class="btn btn-primary btn-lg" href="/product-list" role="button">Product List</a>
                    </sec:authorize>
                </p>
            </div>
        </div>
        </sec:authorize>
    </div>
</div>
<%@ include file="/WEB-INF/includes/footer.jsp" %>