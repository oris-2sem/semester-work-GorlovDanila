<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<header>
    <nav class="navbar fixed-top navbar-expand-md bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/" rel="noopener noreferrer"><img
                    src="${pageContext.request.contextPath}/resources/logos/logo.png" alt="..."></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/"--%>
<%--                           rel="noopener noreferrer">Аниме</a>--%>
<%--                    </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/authors" rel="noopener noreferrer">Создатели</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/genres" rel="noopener noreferrer">Жанры</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/characters" rel="noopener noreferrer">Персонажи</a>
                    </li>
                </ul>

                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <sec:authorize access="isAuthenticated()">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page"
                               href="#"
                               rel="noopener noreferrer">
                                <img src="${pageContext.request.contextPath}/resources/icons/user-regular.svg" style="filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(248deg) brightness(106%) contrast(106%); width: 20px">
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#"
                                       rel="noopener noreferrer"><sec:authentication property="principal.username"/></a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/viewed"
                                       rel="noopener noreferrer">Просмотренное</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"
                                       rel="noopener noreferrer">Выйти</a></li>
                            </ul>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page"
                               href="#"
                               rel="noopener noreferrer">
                                <img src="${pageContext.request.contextPath}/resources/icons/door-open-solid.svg" style="filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(248deg) brightness(106%) contrast(106%); width: 24px">
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/authorization"
                                       rel="noopener noreferrer">Вход</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/registration"
                                       rel="noopener noreferrer">Регистрация</a></li>
                            </ul>
                        </sec:authorize>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</html>
