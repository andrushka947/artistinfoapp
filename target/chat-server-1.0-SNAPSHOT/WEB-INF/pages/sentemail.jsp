<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Successful!</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        .topPanelMain{
             width: 150px;
             height: 50px;
             font-family: "Terminal Dosis", serif;
             font-size: 20px;
             font-style: normal;
             font-variant: normal;
             background-color: #d4d4d4;
             color: #080808;
             text-align: center;
             line-height: 50px;
             display: inline;
             padding: 20px;
             margin-left: -2px;
             margin-right: -2px;
         }
        .topPanel{
            width: 150px;
            height: 50px;
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            font-style: normal;
            font-variant: normal;
            color: #d4d4d4;
            background-color: #080808;
            text-align: center;
            line-height: 50px;
            display: inline;
            padding: 20px;
            margin-left: -2px;
            margin-right: -2px;
        }
        .topPanelMain a{
            color: #080808;
        }
        .topPanel a{
            color: #d4d4d4;
        }
        #errorDiv {
            position: absolute;
            left: 50%;
            top: 20%;
            width: 300px;
            height: 60px;
            margin-left: -150px;
            font-family: "Terminal Dosis", serif;
            font-size: 22px;
            background-color: #2A2A2F;
            font-weight: 500;
            color: #ffffff;
            text-align: center;
            line-height: 60px;
        }
    </style>
</head>
<body>

    <div align="center" >
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a></li>
            <li role="presentation" class="topPanel"><a href="/funnyImages/view">FUNNY IMAGES</a></li>
            <li role="presentation" class="topPanel"><a href="/artists/view">ARTIST LIST</a></li>
            <li role="presentation" class="topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

      <c:if test="${success ne null}">
          <div id="errorDiv">
            <p>The Email was successfully sent!</p>
          </div>
      </c:if>
      <c:if test="${error ne null}">
          <div id="errorDiv">
              <p>Something went wrong. Try again later</p>
          </div>
      </c:if>

</body>
</html>
