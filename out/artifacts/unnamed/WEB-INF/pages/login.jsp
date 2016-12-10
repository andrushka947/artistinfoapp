<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Log In</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body {
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        #loginForm {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300px;
            height: 300px;
            margin: -150px 0 0 -150px;
            background-color: #ffffff;
            font-family: "Terminal Dosis", serif;
            color: #2A2A2F;
            text-align: center;
        }
        #linkDiv {
            color: #2A2A2F;
            position: absolute;
            top: 15%;
            left: 50%;
            width: 200px;
            height: 40px;
            margin: 0 0 0 -94px;
            text-transform: uppercase;

        }
        #linkDiv a {
            font-size: 20px;
            font-weight: 600;
            color: #2A2A2F;
            text-align: center;
        }
        #formDiv {
            position: absolute;
            top: 30%;
            left: 50%;
            width: 200px;
            margin: 0 0 20px -90px;
            color: #ffffff;
            text-align: center;
        }
        #loginInput {
            position: relative;
            width: 200px;
            border: hidden;
            padding: 0;
            font-size: 22px;
            background-color: #2A2A2F;
            color: #ffffff;
            text-align: center;
        }
        #passwordInput {
            position: relative;
            top: 20px;
            width: 200px;
            padding: 0;
            border: hidden;
            font-size: 22px;
            background-color: #2A2A2F;color: #ffffff;
            text-align: center;
        }
        #bttn {
            position: relative;
            top: 80px;
            line-height: 28px;
            width: 100px;
            font-family: "Terminal Dosis", serif;
            font-size: 24px;
            background-color: #2A2A2F;
            text-align: center;
            text-transform: uppercase;
            color: #ffffff;
            border: hidden;
        }
        #badCredentials {
            position: absolute;
            top: 20%;
            left: 50%;
            width: 300px;
            height: 40px;
            margin-left: -150px;
            text-align: center;
            text-transform: uppercase;
            line-height: 40px;
            background-color: #2A2A2F;
            color: #ffffff;
            font-family: "Terminal Dosis", serif;
            font-weight: 500;
            font-size: 20px;
        }
        #bye {
            position: absolute;
            top: 20%;
            left: 50%;
            width: 300px;
            height: 40px;
            margin-left: -150px;
            text-align: center;
            text-transform: uppercase;
            line-height: 40px;
            background-color: #2A2A2F;
            color: #ffffff;
            font-family: "Terminal Dosis", serif;
            font-weight: 500;
            font-size: 20px;
        }

    </style>

</head>
    <c:url value="/j_spring_security_check" var="loginUrl" />

    <div id="loginForm">
        <div id="linkDiv">
            <a href="/register">
                <p>Create new Account</p>
            </a>
        </div>
        <div id="formDiv">
            <form role="form" action="${loginUrl}" method="post">
                <input id="loginInput" type="text" name="j_login" placeholder="login" required autofocus/>
                <input id="passwordInput" type="password" name="j_password" placeholder="password" required/>
                <button id="bttn" type="submit">sign up</button>
            </form>
        </div>
    </div>

    <c:if test="${param.error ne null}">
        <div id="badCredentials">
            <p> Wrong username or password!</p>
        </div>
    </c:if>

    <c:if test="${param.logout ne null}">
        <div id="bye">
            <p>Bye!</p>
        </div>
    </c:if>

</body>
</html>
