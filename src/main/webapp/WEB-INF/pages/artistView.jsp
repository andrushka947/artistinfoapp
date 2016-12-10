<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Artists</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Terminal+Dosis" />   <%--dosis font--%>

    <style>
        body{
            background: url("https://pp.vk.me/c638920/v638920001/fd05/LmYKkbgVMR0.jpg") no-repeat fixed;
            background-size: 100% 100%;
        }
        .myNavBar {
            margin: 0;
        }
        #box div {
            height: 50px;
            border:hidden;
            margin: 0;
            padding: 0;
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
        .artistDiv {
            width: 900px;
            height: 370px;
            margin-top: 60px;
            font-family: "Terminal Dosis", serif;
            background-color: #D3D0CF;
            color: #2A2A2F;
            border-bottom: solid;
            border-color: #222222;
        }
        .artistName {
            width: auto;
            height: 50px;
            font-size: 28px;
            background-color: #EAEAEA;
            text-align: center;
            line-height: 50px;
            border-top: solid;
            border-bottom: double;
            border-color: #2A2A2F;
            font-weight: 700;
            text-transform: uppercase;
        }
        .artistImage {
            height: 300px;
            width: 300px;
            border: hidden;
            float: left;
            display:inline-block;
            padding: 10px 0px 10px 0;
            margin-left: 10px;
        }
        .middleDiv {
            width: 900px;
            height: 300px;
        }
        .summaryDiv {
            width: 560px;
            height: 280px;
            font-size: 19px;
            text-align: center;
            color: #2A2A2F;
            margin: 0;
            padding: 10px 10px 10px 0;
            font-weight: 600;
            display:inline-block;
        }
        .trackDiv {
            font-family: "Terminal Dosis", serif;
            background-color: #EAEAEA;
            border-left: groove;
            border-right: groove;
            border-color: #080808;
        }
        .trackDiv a {
            color: #222222;
        }
        .trackNameDiv {
            color: #EAEAEA;
            background-color: #2A2A2F;
            width: auto;

        }
        .trackNameDiv p {
            font-size: 18px;
            text-transform: uppercase;
        }
        #trackLabel {
            width: 200px;
            height: 50px;
            margin-top: 20px;
            background-color: #2A2A2F;
            font-size: 23px;
            text-align: center;
            line-height: 50px;
            font-family: "Terminal Dosis", serif;
            color: snow;
            text-transform: uppercase;
        }
        .linkDiv {
            padding-bottom: 20px;
            padding-right: 20px;
            margin-bottom: 20px;
            float: right;
            text-decoration: underline;
            font-size: 18px;
        }
        .linkDiv a {
            color: #919191;
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
        #albumDiv {
            height: 300px;
            width: 300px;
            background-color: #ffffff;
            color: #2A2A2F;
            font-family: "Terminal Dosis", serif;
            font-size: 20px;
            text-align: center;
            margin-top: 20px;
        }
        #albumLabel {
            font-size: 24px;
            background-color: #2A2A2F;
            color: #ffffff;
        }
    </style>

</head>
<body>

   <div align="center">
       <c:url value="/logout" var="logoutUrl" />
       <ul class="myNavBar">
           <li role="presentation" class="active topPanelMain"><a href="/">HOME</a>
           <li role="presentation" class="topPanel"><a href="/funnyImages/view">FUNNY IMAGES</a>
           <c:if test="${artists ne null}">
                   <li role="presentation" class="topPanel"><a href="/artists/addArtist">ADD ARTIST</a>
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

    <c:if test="${artists eq null}">
        <div align="center">
            <div>
                <form action="/artists/add" role="search" method="post" id="searchForm">
                    <%--<div id="addInputDiv">--%>
                        <input id="addInput" type="text" name="name" placeholder="ARTIST NAME" required>
                    <%--</div>
                    <div id="addLabelDiv">--%>
                        <button id="addLabel" type="submit">ADD MY FIRST ARTIST</button>
                    <%--</div>--%>
                </form>
            </div>
        </div>
    </c:if>
    </br>

    </br>
    <div align="center">
        <c:forEach var="artist" items="${artists}" >
            <div>
                <div class="artistDiv">
                    <div class="artistName">
                        <p>
                            <c:out value="${artist.name}"/>
                        </p>
                    </div>

                    <div class="row middleDiv">
                        <div class="artistImage">
                            <img src="/artists/photo/${artist.id}" >
                        </div>
                        <div class="summaryDiv">
                            <p><c:out value="${artist.summary}"/></p>
                        </div>

                        <div class="linkDiv">
                            <a href="${artist.url}" target="_blank">
                                Last.fm link
                            </a>
                        </div>
                    </div>

                </div>
                <p id="trackLabel">Tracks</p>

                <div class="row">
                    <div class="col-lg-1"></div>
                    <c:forEach var="track" items="${artist.topTracks}">
                            <div class="col-lg-2 col-md-4 col-xs-6 trackDiv" align="center">
                                <div class="trackNameDiv">
                                    <p><c:out value="${track.name}"/></p>
                                </div>
                                <c:if test="${track.album_url ne null}">
                                    <a href="${track.album_url}" target="_blank">Album: <c:out value="${track.album_title}"/></a>
                                </c:if>
                                <c:if test="${track.album_url eq null}">
                                    <p><c:out value="${track.album_title}"/></p>
                                </c:if>
                                <pre><c:out value="${track.lyrics}"/></pre>
                            </div>
                    </c:forEach>
                    <div class="col-lg-1"></div>
                </div>

                <div id="albumDiv">
                    <p id="albumLabel">Albums:</p>
                    <p>_____________</p>
                    <c:forEach var="album" items="${artist.topAlbums}" >
                        <p><c:out value="${album.name}"/></p>
                    </c:forEach>
                </div>
            </div>

        </c:forEach>
    </div>

</body>
</html>
