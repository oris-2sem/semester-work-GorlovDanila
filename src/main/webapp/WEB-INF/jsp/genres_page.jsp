<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 23.10.2022
  Time: 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:set var="title" value="Энциклопедия жанров"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/genres.css" rel="stylesheet">
</head>
<body class="text-center" id="body">
<jsp:include page="header.jsp"/>
<section class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="list-group my-list">
                    <c:if test="${genresList != null}">
                        <c:forEach var="genre" items="${genresList.genreDtoList}">
                            <a class="list-group-item list-group-item-action text-bg-light active"
                               rel="noopener noreferrer">
                                <p><c:out value="${genre.title}"/></p>
                                <p><c:out value="${genre.info}"/></p>
                                <p>Произведения жанра, представленные на сайте: </p>
                            <table class="table table-light">
                                <tbody>
                                <c:forEach var="anim" items="${genre.anims}">
                                    <tr>
                                        <th scope="row"><c:out value="${anim}"/></th>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            </a>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
