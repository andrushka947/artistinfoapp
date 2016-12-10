<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Funny images</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body {
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
        #inputButton {
            padding: 0;
            border: hidden;
            margin-left: -3px;
        }
        form {
            font-family: "Terminal Dosis", serif;
        }
        #inputLabel {

            height: 22px;
            text-align: center;
            background-color: #2A2A2F;
            color: #FFFFFF;
            margin-left: 0;
            padding-left: 0;
            display: inline;
        }
        #uploadPhoto {
            position: relative;
            top: 30px;
        }
        #onAddDiv {
            position: absolute;
            left: 50%;
            top: 120px;
            width: 200px;
            height: 40px;
            margin-left: -100px;
            line-height: 40px;
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            background-color: #2A2A2F;
            color: #ffffff;
            text-align: center;
        }
        #photosDiv {
            position: relative;
            top: 100px;
        }
    </style>
</head>
<body>

    <div align="center" >
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a></li>
            <c:if test="${access eq 'granted'}">
                <li role="presentation" class="topPanel"><a href="funnyImages/delete">DELETE ARTIST</a></li>
            </c:if>
            <li role="presentation" class="topPanel"><a href="/artists/view">ARTIST LIST</a></li>
            <li role="presentation" class="topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

    <div align="center" id="uploadPhoto">
        <form action="/funnyImages/add" enctype="multipart/form-data" method="POST">
            <input type="file" name="photo" id="inputLabel" required="">
            <button type="submit" id="inputButton">
                <img src="https://pp.vk.me/c638830/v638830687/14df2/AzDRcXTozss.jpg" style="height: 22px">
            </button>
        </form>
    </div>

    <c:if test="${param.success ne null}">
        <div id="onAddDiv">
            <p> Image successfully added!</p>
        </div>
    </c:if>

    <c:if test="${param.emp ne null}">
        <div id="onAddDiv">
            <p> Image is empty!</p>
        </div>
    </c:if>

   <%-- <c:if test="${param.userccess eq 'denied'}">--%>
        <div align="center" id="photosDiv">
            <c:forEach var="image" items="${images}" >
                <div>
                    <img src="/funnyImages/${image.key}" width="800" alt="Funny:) Isn't it?">
                </div>
                <p>__________________________________________________________________________</p>
            </c:forEach>
        </div>
    <%--</c:if>--%>
    <c:if test="${param.useraccess eq 'granted'}">
        <div id="deleteDiv">
            <table id="deleteTable">
                <tr id="tableRowUnique">
                    <td id="tableColumnFlag">Flag</td>
                    <td id="tableColumnName">Image</td>
                </tr>
                <c:forEach var="image" items="${images}" >
                    <tr id="tableRow">
                        <td class="tableColumnFlag"><input type="checkbox" name = "ids" value=${artist.id}></td>
                        <td class="tableColumnName"><img src="/funnyImages/${image.key}" width="400" alt="Funny:) Isn't it?"></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:if>

</body>
</html>