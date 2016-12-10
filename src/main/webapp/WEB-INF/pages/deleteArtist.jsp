<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete artist</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        .deleteLabel {
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            font-style: normal;
            font-variant: normal;
            font-weight: 400;
            height: 60px;
            width: 500px;
            text-align: center;
            line-height: 60px;
            color: snow;
            background-color: #101010;
        }
        .deleteTable {
            width: 500px;
            background-color: #d4d4d4;

        }
        .tableColumnName {
            width: 400px;
            text-align: center;
            line-height: 50px;
        }
        .tableColumnFlag {
            width: 100px;
            text-align: center;
            line-height: 50px;
        }
        .tableRow {
            height: 50px;
            width: 500px;
        }
        .tableRowUnique {
            height: 50px;
            width: 500px;
            border-bottom: double;
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
        #deleteButton {
            text-align: center;
            width: 200px;
            height: 40px;
            font-family: "Terminal Dosis", serif;
            line-height: 40px;
            position: relative;
            background-color: #2A2A2F;
            color: #ffffff;
            border: hidden;
        }
        .topPanelMain a{
            color: #080808;
        }
        .topPanel a{
            color: #d4d4d4;
        }
    </style>

</head>

    <div align="center" >
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a></li>
            <li role="presentation" class="active topPanel"><a href="/funnyImages/view">FUNNY IMAGES</a></li>
            <li role="presentation" class="active topPanel"><a href="/artists/view">ARTIST LIST</a></li>
            <li role="presentation" class="active topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

    <br/>
    <br/>
    <br/>
    <br/>

    <div class="row">
        <div class="col-lg-4 col-xs-3"></div>
        <div class="col-lg-4 col-xs-6" align="center">
            <form action="/artists/doDelete" method="get">
                <div class="deleteLabel">
                    <p>
                        DELETE ARTISTS:
                    </p>
                </div>
                <div class="deleteTable">
                    <table <%--class="table table-hover"--%>>
                        <tr class="tableRowUnique">
                            <td class="tableColumnFlag">Flag</td>
                            <td class="tableColumnName">Artist name</td>
                        </tr>
                        <c:forEach items="${artists}" var="artist">
                        <tr class="tableRow">
                            <td class="tableColumnFlag"><input type="checkbox" name = "ids" value=${artist.id}></td>
                            <td class="tableColumnName"><c:out value="${artist.name}"> </c:out></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <button type="submit" value="DELETE CHECKED ARTISTS" id="deleteButton">DELETE CHECKED ARTISTS</button>
            </form>
        </div>
    </div>

</body>
</html>
