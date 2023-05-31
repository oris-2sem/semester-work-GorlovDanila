<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 31.10.2022
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';
    img-src 'self';
    preconnect-src 'self' https://fonts.googleapis.com https://fonts.gstatic.com;
  "
/>
<head id="head">
    <c:set var="title" value="Просмотренное"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/viewed_page.css" rel="stylesheet">
</head>
<body id="body">
<jsp:include page="header.jsp"/>
<%--<nav class="navbar fixed-top navbar-expand-md bg-dark">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="${pageContext.request.contextPath}/" rel="noopener noreferrer"><img src="../../resources/logos/logo.png" alt="..."></a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"--%>
<%--                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--            <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/" rel="noopener noreferrer">Аниме</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="${pageContext.request.contextPath}/authors" rel="noopener noreferrer">Создатели</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="${pageContext.request.contextPath}/genres" rel="noopener noreferrer">Жанры</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            --%>
<%--            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <c:if test="${sessionScope.currentUser != null}">--%>
<%--                        <c:set var="user" value="${(sessionScope.currentUser)}"/>--%>
<%--                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#" rel="noopener noreferrer">--%>
<%--                            <i class="fa-regular fa-user fa-xl"></i></a>--%>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <li><a class="dropdown-item active text-bg-light" rel="noopener noreferrer"><c:out value="${user.login}"/>--%>
<%--                            </a></li>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item active text-bg-light" rel="noopener noreferrer"><c:out value="${user.password}"/>--%>
<%--                            </a></li>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/viewed" rel="noopener noreferrer">Просмотренное</a></li>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/registration" rel="noopener noreferrer">Выйти</a></li>--%>
<%--                        </ul>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${sessionScope.currentUser == null}">--%>
<%--                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#" rel="noopener noreferrer"><i--%>
<%--                                class="fa-solid fa-door-open fa-xl"></i></a>--%>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/authorization" rel="noopener noreferrer">Вход</a></li>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/registration" rel="noopener noreferrer">Регистрация</a></li>--%>
<%--                        </ul>--%>
<%--                    </c:if>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<section class="main-content my-cont">
    <div class="container">
        <h3 class="h3-10">Моё просмотренное</h3>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="list-group my-list">
                    <c:if test="${listViewed != null}">
                        <c:forEach var="anim" items="${listViewed}">
                            <a class="list-group-item list-group-item-action active text-bg-light" rel="noopener noreferrer">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="ms-1"><c:out value="${anim.title}"/>
                                    </h5>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-sm-4">
                                        <img src="${anim.linkToImage}" width="150px" alt="...">
                                    </div>
                                    <div class="col-lg-8 col-sm-8">
                                        Жанры: <c:out value="${anim.genres.stream().map(it -> it.name).toList()}"/>
                                        <br>
                                        Автор: <c:out value="${anim.authorId.name}"/>
                                        <br>
                                        Год: <c:out value="${anim.year}"/>
                                        <br>
                                        Тип: <c:out value="${anim.type}"/>
                                        <br>
                                        Статус: <c:out value="${anim.status}"/>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:if>
<%--                    </c:if>--%>
                    <c:if test="${listViewed.size() == 0}">
                        <h1 style="text-align: center">Вы пока ничего не посмотрели)=</h1>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-12 col-sm-12">--%>
<%--                                <img src="/resources/images/bleach.jpg">--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
