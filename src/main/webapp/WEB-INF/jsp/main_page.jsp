<%--Created by IntelliJ IDEA.
User: danil
Date: 21.10.2022
Time: 17:26
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';
    img-src 'self';
  "
/>
<html>
<head>
    <c:set var="title" value="Добро пожаловать!"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/main_page.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container cont-main">
    <div class="row">
        <div class="col-lg-12 col-sm-12">
            <div id="carouselExampleControls" class="carousel my-carousel" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/Human-benz.png"
                                    class="d-block w-100"
                                    alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Человек-бензопила</h5>
                                <p class="card-text">Жанры: Боевик, Фэнтези, Ужасы.</p>
                                <form action="${pageContext.request.contextPath}/title/3" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/bleach.jpg"
                                    class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Блич: Тысячелетняя война</h5>
                                <p class="card-text">Жанры: Фэнтези, Приключения, Сверхъестественное.</p>
                                <form action="${pageContext.request.contextPath}/title/2" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/mob.jpg"
                                    class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Моб Психо 100 3</h5>
                                <p class="card-text">Жанры: Комедия, Сверхъестественное, Супер сила, Экшен.</p>
                                <form action="${pageContext.request.contextPath}/title/6" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/spy_family.jpg"
                                    class="d-block w-100"
                                    alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Семья шпиона</h5>
                                <p class="card-text">Жанры: Боевик, Комедия, Шпионская фантастика.</p>
                                <form action="${pageContext.request.contextPath}/title/4" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/cyberpank.jpg"
                                    class="d-block w-100"
                                    alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Киберпанк: Бегущие по краю</h5>
                                <p class="card-text">Жанры: Фантастика, Экшен</p>
                                <form action="${pageContext.request.contextPath}/title/5" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img
                                    src="${pageContext.request.contextPath}/resources/images/blue_prison.jpg"
                                    class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Синяя тюрьма</h5>
                                <p class="card-text">Жанры: Сёнэн, Спорт, Драма, Психология</p>
                                <form action="${pageContext.request.contextPath}/title/1" method="get">
                                    <input type="hidden" name="myTitle"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/carusel_script.js" rel="script"></script>
<section class="main-content" style="margin-bottom: 50px">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-8">
                <div class="list-group my-list">
                    <c:if test="${animList != null}">
                        <c:forEach var="anim" items="${animList}">
                            <a class="list-group-item list-group-item-action active text-bg-light"
                               rel="noopener noreferrer">
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
                                <form action="/title/${anim.id}" method="get" style="padding-top: 5px">
                                    <button type="submit" class="btn btn-dark my-button">Перейти</button>
                                </form>
                            </a>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-4 col-sm-4">
                <div class="list-group my-list">
                    <a class="list-group-item nav-link active" rel="noopener noreferrer">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Фильтр</h5>
                        </div>
                    </a>
                    <form method="post">
                        <sec:csrfInput />
                        <a class="list-group-item nav-link active text-bg-light" rel="noopener noreferrer">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Год</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedYear">
                                <option selected>Выберите год</option>
                                <c:if test="${listForFilterYears != null}">
                                    <c:forEach var="year" items="${listForFilterYears}">
                                        <option value="${year}"><c:out value="${year}"/></option>
                                        <%--                                        <form:label path="${year}"><c:out value="${year}"/></form:label>--%>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light" rel="noopener noreferrer">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Жанры</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Выберите жанр" name="selectedGenre">
                                <option selected>Выберите жанр</option>
                                <c:if test="${listForFilterGenres != null}">
                                    <c:forEach var="genre" items="${listForFilterGenres}">
                                        <option value="${genre.name}"><c:out value="${genre.name}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light" rel="noopener noreferrer">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Тип</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Выберите тип" name="selectedType">
                                <option selected>Выберите тип</option>
                                <c:if test="${listForFilterTypes != null}">
                                    <c:forEach var="type" items="${listForFilterTypes}">
                                        <option value="${type}"><c:out value="${type}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light" rel="noopener noreferrer">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Статус</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedStatus">
                                <option selected>Выберите статус</option>
                                <c:if test="${listForFilterStatus != null}">
                                    <c:forEach var="status" items="${listForFilterStatus}">
                                        <option value="${status}"><c:out value="${status}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light" rel="noopener noreferrer">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Создатель</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedAuthor">
                                <option selected>Выберите создателя</option>
                                <c:if test="${listForFilterAuthors != null}">
                                    <c:forEach var="author" items="${listForFilterAuthors}">
                                        <option value="${author.name}"><c:out value="${author.name}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <button type="submit" class="btn btn-dark my-button">Искать</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script>--%>
<%--    id="clickStartFilter"--%>
<%--    function clean() {--%>
<%--        const head = document.getElementById("head").innerHTML;--%>
<%--        document.getElementById("head").innerHTML = DOMPurify.sanitize(head, null);--%>

<%--        const body = document.getElementById("body").innerHTML;--%>
<%--        document.getElementById("body").innerHTML = DOMPurify.sanitize(body, null);--%>
<%--    }--%>
<%--    document.getElementById("clickClean").onclick = clean;--%>
<%--</script>--%>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
