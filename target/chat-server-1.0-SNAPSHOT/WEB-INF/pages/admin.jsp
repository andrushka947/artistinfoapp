<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin page</title>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
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
        #adminDiv {
            position: relative;
            top: 100px;
            left: 50%;
            width: 300px;
            margin-left: -150px;
            font-family: "Terminal Dosis", serif;
            font-size: 22px;
            background-color: #ffffff;
            color: #2A2A2F;

        }
        #userTable {
            position: absolute;
            top: 40%;
            left: 50%;
            width: 300px;
            margin-left: -350px;
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            background-color: #ffffff;
            text-align: center;
        }
        #artistTable {
            position: absolute;
            top: 40%;
            left: 50%;
            width: 300px;
            margin-left: 50px;
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            background-color: #ffffff;
            text-align: center;
        }
        #userUniqueRow {
            background-color: #2A2A2F;
            color: #ffffff;
            text-align: center;
            height: 30px;
            line-height: 30px;
            width: 300px;
            border: hidden;
        }
        #artistUniqueRow {
            background-color: #2A2A2F;
            color: #ffffff;
            text-align: center;
            height: 30px;
            line-height: 30px;
            width: 300px;
            border: hidden;
        }
        .row {
            height: 30px;
            line-height: 30px;
            width: 300px
            text-align: center;
        }
        #tableDiv {
            width: 300px;
            border: hidden;
        }

    </style>
</head>
<body background="../images/background_mus.jpg">

    <div align="center">
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a>
            <li role="presentation" class="topPanel"><a href="/funnyImages/view">FUNNY IMAGES</a>
                <c:if test="${artists ne null}">
                    <li role="presentation" class="topPanel"><a href="/artists/view">ARTIST LIST</a>
                </c:if>
                <c:if test="${artists ne null}">
                    <li role="presentation" class="topPanel"><a href="/artists/delete">DELETE ARTISTS</a>
                </c:if>
                <c:if test="${email ne null}">
                    <c:if test="${email ne ''}">
                        <li role="presentation" class="topPanel"><a href="/artists/sendemail" title="You will get email with Last.fm links for yours artist">GET MAIL</a>
                    </c:if>
                </c:if>
            <li role="presentation" class="topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

    <div align="center" id="adminDiv">
        <h1>Secret page for admins only!</h1>
    </div>

    <div>
        <div id="userTable">
            <table id="tableDiv">
                <tr id="userUniqueRow">
                    <td>
                        <p>User name</p>
                    </td>
                </tr>
                <c:forEach items="${userlist}" var="user">
                    <tr class="row">
                        <td>
                            <p><c:out value="${user.login}"/></p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div id="artistTable">
            <table  id="tableDiv">
                <tr id="artistUniqueRow">
                    <td>Artist name:</td>
                </tr>
                <c:forEach items="${artistlist}" var="artist">
                    <tr class="row">
                        <td>
                            <p><c:out value="${artist.name}"/></p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>
