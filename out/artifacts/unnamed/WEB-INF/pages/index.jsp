<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Personal Page</title>
    <%--<link rel="stylesheet" href="../css/bootstrap.min.css.css">--%>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        #mainDiv {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            height: 320px;
            margin: -160px 0 0 -200px;
            padding-top: 20px;
            background-color: #9d9d9d;
            text-align: center;
            font-family: "Terminal Dosis", serif;
            font-size: 24px;
            color: #222222;

        }
        #mainDiv h3 {
            font-size: 30px;
        }
        #hrLine {
            width: 350px;
            margin-top: 60px;
            height: 3px;
            margin-bottom: 0;
            background-color: #000000;
            border: hidden;

        }
        input {
            background-color: #101010;
            width: 250px;
            height: 30px;
            font-family: "Terminal Dosis", serif;
            font-size: 16px;
            color: snow;
            text-align: center;
            padding: 0;
            border: hidden;
            margin-right: 0;
        }
        #inputButton {
            padding: 0;
            border: hidden;
            margin-left: -3px;
        }
        .myNavBar {
            margin: 0;
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
    </style>
</head>
<body>

    <div align="center" >
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a></li>
            <c:if test="${role eq 'ROLE_ADMIN'}">
                <li role="presentation" class="topPanel"><a href="/admin">ADMIN PAGE</a></li>
            </c:if>
            <li role="presentation" class="topPanel"><a href="/funnyImages/view">FUNNY IMAGES</a></li>
            <li role="presentation" class="topPanel"><a href="/artists/view">ARTIST LIST</a></li>
            <li role="presentation" class="topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

    <div align="center">
        <div align="center" id="mainDiv">
            <h3> Hello, ${login}</h3>
            <p>
                Set up your email to enable<br/>
                function sending artist list<br/>
                to your email address
            </p>
            <hr id="hrLine">
            <c:url value="/update" var="updateUrl" />
            <form action="${updateUrl}" method="POST">
                <input type="text" value="${email}" name="email" placeholder="example@mail.com">
                <button type="submit" id="inputButton">
                    <img src="https://pp.vk.me/c638830/v638830687/14deb/p_GqPLTg2So.jpg">
                </button>
            </form>
        </div>

    </div>

</body>
</html>
