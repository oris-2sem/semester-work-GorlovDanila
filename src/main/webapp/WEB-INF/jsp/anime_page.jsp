<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 23.10.2022
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%--<meta--%>
<%--        http-equiv="Content-Security-Policy"--%>
<%--        content="--%>
<%--    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;--%>
<%--    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';--%>
<%--    img-src 'self';--%>
<%--    preconnect-src 'self' https://fonts.googleapis.com https://fonts.gstatic.com;--%>
<%--  "--%>
<%--/>--%>
<head id="head">
    <c:set var="title" value="Тайтл"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
            integrity="sha512-6UofPqm0QupIL0kzS/UIzekR73/luZdC6i/kXDbWnLOJoqwklBK6519iUnShaYceJ0y4FaiPtX/hRnV/X/xlUQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="${pageContext.request.contextPath}/resources/mediaElement/mediaelementplayer.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/mediaElementPlugin/loop.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/mediaElementPlugin/playlist.min.css"
          rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="${pageContext.request.contextPath}/resources/css/anime_page.css" rel="stylesheet">
</head>
<body id="body">
<jsp:include page="header.jsp"/>
<section class="main-content">
    <div class="container my-cont">
        <div class="row">
            <div class="col-lg-4 col-sm-4">
                <c:if test="${myAnimEntity != null}">
                <c:set var="anim" value="${myAnimEntity}"/>
                <img class="my-img" src="${anim.linkToImage}" width="250px" alt="...">
            </div>
            <div class="col-lg-8 col-sm-8">
                <div class="my-text">
                    Тип: <c:out value="${anim.type}"/>
                    <br>
                    Статус: <c:out value="${anim.status}"/>
                    <br>
                    Год: <c:out value="${anim.year}"/>
                    <br>
                    Жанр: <c:out value="${anim.genres.stream().map(it -> it.name).toList()}"/>
                    <br>
                    Автор: <c:out value="${anim.authorId.name}"/>
                    <br>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-sm-1">
        </div>
        <div class="col-lg-10 col-sm-10 my-center">
            <h5>Смотреть аниме «<c:out value="${anim.title}"/>» онлайн</h5>
            <video data-cast-title="CodeTube Playlist" data-cast-description="Description codetube tuttorial"
                   width="925" height="480">
                <source title="Trailer" data-playlist-thumbnail="${anim.linkToImage}" src="${anim.link}"
                        type="video/mp4">
                <source title="2" data-playlist-thumbnail="${anim.linkToImage}"
                        src="${pageContext.request.contextPath}/resources/videos/test.mp4"
                        type="video/mp4">
            </video>
        </div>
        <div class="col-lg-2 col-sm-2">
            <br>
            <br>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/mediaElement/mediaelement-and-player.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/mediaElementPlugin/loop.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/mediaElementPlugin/playlist.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/videoplayer.js" rel="script"></script>
<%--<jsp:include page="footer_scripts.jsp"/>--%>
</body>
</html>
