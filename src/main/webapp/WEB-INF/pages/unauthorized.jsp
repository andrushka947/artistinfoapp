<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <c:if test="${role ne 'admin'}">
        <title>Access denied</title>
    </c:if>
    <c:if test="${role eq 'admin'}">
        <title>Access granted</title>
    </c:if>
    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        #deniedDiv {
            position: absolute;
            top: 40%;
            left: 50%;
            width: 400px;
            height: 150px;
            margin: -75px 0 0 -200px;
            font-size: 22px;
            font-family: "Terminal Dosis", serif;
            background-color: #2A2A2F;
            color: #FFFFFF;
            text-align: center;
            text-transform: uppercase;
        }
        #deniedDiv a {
            color: #2A2A2F;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <div id="deniedDiv">
        <p>Access denied for ${login}!</p>

        <c:url value="/logout" var="logoutUrl" />
        <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
    </div>
</body>
</html>