<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Artist</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        #alertDiv{
            position: absolute;
            margin-left: 50%;
            margin-right: 50%;
            margin-top: 280px;
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
        #addInput {
            font-size: 26px;
            background-color: #2A2A2F;
            color: #EAEAEA;
            text-align: center;
            border: hidden;
            height: 60px;
            width: 350px;
        }
        #addLabel{
            float: right;font-size: 20px;
            background-color: #2A2A2F;
            color: #EAEAEA;
            text-transform: uppercase;
            text-align: center;
            border: hidden;
            height: 60px;
            width: 150px;
            border-left: 1px solid #ffffff;
        }
        #searchForm {
             position: absolute;
             top: 50%;
             left: 50%;
             width: 500px;
             height: 60px;
             margin-left: -250px;
             margin-top: -30px;
             font-family: "Terminal Dosis", serif;
             font-size: 24px;
             overflow: hidden;
         }
    </style>

</head>
<body background="../images/background_mus.jpg">

    <div align="center" >
        <c:url value="/logout" var="logoutUrl" />
        <ul class="myNavBar">
            <li role="presentation" class="active topPanelMain"><a href="/">HOME</a></li>
            <c:if test="${artists ne null}">
                <li role="presentation" class="topPanel"><a href="/artists/addArtist">ADD ARTIST</a></li>
            </c:if>
            <c:if test="${artists ne null}">
                <li role="presentation" class="topPanel"><a href="/artists/delete">DELETE ARTISTS</a></li>
            </c:if>
            <c:if test="${email ne null}">
                <c:if test="${email ne ''}">
                    <li role="presentation" class="topPanel">
                        <a href="artists/sendemail" title="You will get email with Last.fm links for yours artist">GET MAIL</a>
                    </li>
                </c:if>
            </c:if>
            <li role="presentation" class="topPanel"><a href="/artists/view">ARTIST LIST</a></li>
            <li role="presentation" class="topPanelMain"><a href="${logoutUrl}">LOGOUT</a></li>
        </ul>
    </div>

    <div>
        <c:if test="${param.success eq null}">
            <form action="/artists/add" role="search" method="post" id="searchForm">
                <input type="text" id="addInput" name="name" placeholder="Artist name" required>
                <button type="submit" id="addLabel">Search</button>
            </form>
        </c:if>
    </div>

<br/>
<br/>
<br/>
<br/>

    <c:if test="${connError ne null}">
        <div class="alert alert-info" role="alert" id="alertDiv">
            <p>Something went wrong with the connection to the database.</p>
            <p>Please try again later.</p>
        </div>
    </c:if>

    <c:if test="${repeat ne null}">
        <div class="alert alert-info" role="alert">
            <p>You already have this artist in your library!</p>
        </div>


        <div align="center">
            <p><c:out value="${artist.name}"/></p></br>

            <img src="/artists/photo/${artist.id}" >
            <br/>

            <div class="alert alert-info" align="center" style="width: 300px">
                <a href="${artist.url}" target="_blank">
                    Last.fm link
                </a>
            </div>

            <div style="padding-left: 5px">
                <p class="lead"><c:out value="${artist.summary}"/></p>
            </div>

            <p>Tracks:</p>
            <div class="row">
                <div class="col-lg-1"></div>
                <c:forEach var="track" items="${artist.topTracks}">
                    <div class="col-lg-2 col-md-4 col-xs-6" align="center">
                        <p style="font-size: 19px;"><c:out value="${track.name}"/></p>
                        <a href="${track.album_url}" target="_blank">Album: <c:out value="${track.album_title}"/></a>
                        <pre><c:out value="${track.lyrics}"/></pre>
                    </div>
                </c:forEach>
                <div class="col-lg-1"></div>
            </div>

            <p>Albums:</p>
            <p>_______</p>
            <c:forEach var="album" items="${artist.topAlbums}" >
                <p><c:out value="${album.name}"/></p>
            </c:forEach>
        </div>
    </c:if>


</body>
</html>
