<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 23.10.2022
  Time: 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css;
    img-src 'self' data:;
  "
/>
<head id="head">
    <c:set var="title" value="Создатели"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/authors_page.css" rel="stylesheet">
</head>
<body class="text-center" id="body">
<jsp:include page="header.jsp"/>
<section class="main-content" style="margin-right: 20px">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5 col-sm-5 no-padding">
                <button type="submit" class="btn btn-dark my-button" id="clickStartFilter"
                        style="margin-top: 25px; margin-left: 30px; width: 100%">Сортировка по началу
                    карьеры
                </button>
            </div>
            <div class="col-lg-2 col-sm-2 no-padding"></div>
            <div class="col-lg-5 col-sm-5 no-padding">
                <button type="submit" class="btn btn-dark my-button" id="clickEndFilter"
                        style="margin-top: 25px; width: 100%">Сортировка по концу
                    карьеры
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12 no-padding">
                <div class="list-group my-list">
                    <ul id="authors-list">
                        <div class="row gx-0">
                            <div class="col-lg-4 col-sm-4" id="img">
<%--                                <img src="${character.link}" width="250px" alt="...">--%>
                            </div>
                            <div class="col-lg-8 col-sm-8" id="info">
<%--                                Информация: <c:out value="${character.info}"/>--%>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
