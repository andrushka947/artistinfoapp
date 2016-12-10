<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Andrushka
  Date: 12/7/2016
  Time: 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

  <title>Delete Images</title>


  <style>
      body{
          background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
          background-size: 100% 100%;
      }
      #deleteTable {
        width: 500px;
        background-color: #d4d4d4;
      }
      #tableRow {
        height: 50px;
        width: 500px;
      }
      #tableRowUnique {
        height: 50px;
        width: 500px;
        border-bottom: double;
      }
      #tableColumnName {
        width: 400px;
        height: 300px;
      }
      #tableColumnFlag {
        width: 100px;
        text-align: center;
        line-height: 50px;
      }

  </style>

</head>
<body>

    <div align="center">
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
</body>
</html>
