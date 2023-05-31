<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 21.10.2022
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';
    img-src 'self' data:;
  "
/>
<head id="head">
    <c:set var="title" value="Админка"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/admin_page.css" rel="stylesheet">
</head>
<body id="body">
<jsp:include page="header.jsp"/>
<section class="main-content">
    <div class="container">
        <div class="row">
            <div class="col">
                <main class="form-signin">
                    <h1 class="h3 mb-3 fw-normal h3-form">Сущность аниме</h1>
                    <form method="post" action="http://localhost:8080/admin/anim">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-form">Форма добавления</h1>
                        <div class="row m-top-1">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputTitleAnime"
                                           placeholder="name@example.com"
                                           name="titleNewAnime">
                                    <label for="floatingInputTitleAnime">Title new anime</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputGenreNewTitle"
                                           placeholder="name@example.com"
                                           name="newAnimeGenre">
                                    <label for="floatingInputGenreNewTitle">Genre new anime</label>
                                </div>
                            </div>
                        </div>
                        <div class="row m-top-1">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputNameNewAuthorAdd"
                                           placeholder="name@example.com"
                                           name="nameNewAuthor">
                                    <label for="floatingInputNameNewAuthorAdd">Name new author</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputYearNewAnime"
                                           placeholder="name@example.com"
                                           name="yearNewAnime">
                                    <label for="floatingInputYearNewAnime">Year new anime</label>
                                </div>
                            </div>
                        </div>
                        <div class="row m-top-1">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputTypeNewAnime"
                                           placeholder="name@example.com"
                                           name="typeNewAnime">
                                    <label for="floatingInputTypeNewAnime">Type new anime</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputStatusNewAnime"
                                           placeholder="name@example.com"
                                           name="statusNewAnime">
                                    <label for="floatingInputStatusNewAnime">Status new anime</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>


                    <form method="post" action="http://localhost:8080/admin/anim">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-delete">Форма удаления</h1>
                        <p class="mb-1"><select class="form-select" aria-label="Title anime to delete"
                                                name="titleAnimeDelete">
                            <option selected>Выберите название аниме для удаления</option>
                            <c:if test="${animList!= null}">
                                <c:forEach var="anim" items="${animList}">
                                    <option value="${anim.title}"><c:out value="${anim.title}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>

                    <form method="post" action="http://localhost:8080/admin/anim">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-delete">Форма изменения</h1>

                        <p class="mb-1"><select class="form-select" aria-label="Title anim to edit"
                                                name="lastTitleAnime">
                            <option selected>Выберите название аниме для изменения</option>
                            <c:if test="${animList!= null}">
                                <c:forEach var="anim" items="${animList}">
                                    <option value="${anim.title}"><c:out value="${anim.title}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>

                        <div class="form-floating m-top-1">
                            <input type="text" class="form-control" id="floatingInputTitleNewAnime"
                                   placeholder="Password"
                                   name="newTitleAnime">
                            <label for="floatingInputTitleNewAnime">Title new anime</label>
                        </div>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>

                    <h1 class="h3 mb-3 fw-normal h3-form">Сущность автор</h1>

                    <form method="post" action="http://localhost:8080/admin/author">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-form">Форма добавления</h1>
                        <div class="row m-top-1">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputNameAuthor"
                                           placeholder="name@example.com"
                                           name="newNameAuthor">
                                    <label for="floatingInputNameAuthor">Name new author</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputInfoAuthor"
                                           placeholder="name@example.com"
                                           name="newInfoAuthor">
                                    <label for="floatingInputInfoAuthor">Info new author</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>

                    <form method="post" action="http://localhost:8080/admin/author">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-delete">Форма удаления</h1>
                        <p class="mb-1"><select class="form-select" aria-label="Name author to delete"
                                                name="nameDeleteAuthor">
                            <option selected>Выберите имя автора для удаления</option>
                            <c:if test="${authorList!= null}">
                                <c:forEach var="author" items="${authorList}">
                                    <option value="${author.name}"><c:out value="${author.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>

                    <form method="post" action="http://localhost:8080/admin/author">
                        <sec:csrfInput/>
                        <h1 class="h3 mb-3 fw-normal h3-delete">Форма изменения</h1>

                        <p class="mb-1"><select class="form-select" aria-label="Name author to edit"
                                                name="NameLastAuthor">
                            <option selected>Выберите имя автора для изменения</option>
                            <c:if test="${authorList!= null}">
                                <c:forEach var="author" items="${authorList}">
                                    <option value="${author.name}"><c:out value="${author.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>

                        <div class="form-floating m-top-1">
                            <input type="text" class="form-control" id="floatingInputNameNewAuthor"
                                   placeholder="Password"
                                   name="NameNewAuthor">
                            <label for="floatingInputNameNewAuthor">Name new author</label>
                        </div>
                        <br>
                        <p class="mb-1"><select class="form-select" aria-label="Info author to edit"
                                                name="InfoLastAuthor">
                            <option selected>Выберите информацию об авторе для изменения</option>
                            <c:if test="${authorList!= null}">
                                <c:forEach var="author" items="${authorList}">
                                    <option value="${author.info}"><c:out value="${author.info}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>
                        <div class="form-floating m-top-1">
                            <input type="text" class="form-control" id="floatingInputInfoNewAuthor"
                                   placeholder="Password"
                                   name="InfoNewAuthor">
                            <label for="floatingInputInfoNewAuthor">Info about new author</label>
                        </div>
                        <br>
                        <button class="w-100 btn btn-lg btn-dark m-top-1" type="submit">Подтвердить
                        </button>
                    </form>
                </main>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Info</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${authorList!= null}">
                        <c:forEach var="author" items="${authorList}">
                            <tr>
                                <th scope="row"><c:out value="${author.id}"/></th>
                                <td><c:out value="${author.name}"/></td>
                                <td><c:out value="${author.info}"/></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Title</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Author</th>
                        <th scope="col">Year</th>
                        <th scope="col">Type</th>
                        <th scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${animList!= null}">
                        <c:forEach var="anim" items="${animList}">
                            <tr>
                                <th scope="row"><c:out value="${anim.id}"/></th>
                                <td><c:out value="${anim.title}"/></td>
                                <td><c:out value="${anim.genres.stream().map(it -> it.name).toList()}"/></td>
                                <td><c:out value="${anim.authorId.name}"/></td>
                                <td><c:out value="${anim.year}"/></td>
                                <td><c:out value="${anim.type}"/></td>
                                <td><c:out value="${anim.status}"/></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
