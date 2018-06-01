<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true" %>
<html>
<head>
    <title>Store Finder PH</title>
    <link href="assets/css/bootstrap-united.css" rel="stylesheet"/>
    <link href="/js/datetimepicker/jquery.datetimepicker.min.css" rel="stylesheet"/>
    <link href="<c:url value="/datepicker/css/datepicker.css" />" rel="stylesheet"/>
    <script src="<c:url value="/js/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/js/jquery/jquery-3.2.1.js" />"></script>
    <script src="<c:url value="/js/jquery/jquery.tabletojson.min.js" />"></script>
    <script src="<c:url value="/js/datetimepicker/jquery.datetimepicker.full.min.js" />"></script>
    <script src="<c:url value="/js/script.js" />"></script>
    <script src="<c:url value="/bootstrap/js/bootstrap.min.js" />"></script>
    <style>
        body {
            height: 100%;
            margin: 0;
            background: url(assets/img/bg.jpg) fixed;
            background-size: 1440px 800px;
            background-repeat: no-repeat;
            display: compact;
            overflow-x: hidden;
        }

        .green {
            font-weight: bold;
            color: green;
        }

        .message {
            margin-bottom: 10px;
        }

        .error {
            color: #ff0000;
            font-weight: bold;
        }

        .errorblock {
            color: #000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }

        .mp {
            padding-top: 20px !important;
            padding-right: 20px !important;
            padding-left: 20px !important;
        }
    </style>
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-responsive-collapse">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
    </div>

    <div class="navbar-collapse">
        <div class="navbar-form navbar-left">
            <h5 style="font-weight: bold; color: white;">STORE FINDER PH</h5>
        </div>

        <form class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>

        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item active"><a href=".">Home</a></li>
            <sec:authorize access="isAuthenticated()">
                <!-- For login user -->
                <c:url value="/logout" var="logoutUrl"/>
                <li>
                    <form action="${logoutUrl}" method="post" id="logoutForm" style="display:none"></form>
                </li>
                <script>
                    function formSubmit() {
                        document.getElementById("logoutForm").submit();
                    }
                </script>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item"><a class="navbar-brand"
                                                href="#">User: ${pageContext.request.userPrincipal.name} - ${email}</a>
                        </li>
                        <li class="nav-item"><a href="javascript:formSubmit()"> Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a href="signup">Signup</a></li>
                        <li class="nav-item"><a href="login">Login</a></li>
                    </c:otherwise>
                </c:choose>
            </sec:authorize>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Explore</a>
                <ul class="dropdown-menu">
                    <li><a href="#">Contact us</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Further Actions</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<br><br><br><br>