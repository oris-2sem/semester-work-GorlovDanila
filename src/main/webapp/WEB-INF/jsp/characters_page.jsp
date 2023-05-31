<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 13.05.2023
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<head>
    <c:set var="title" value="Персонажи"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/main_page.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<jsp:include page="header.jsp"/>
<body>
<section class="main-content" style="margin-bottom: 50px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="list-group my-list">
                    <c:if test="${charactersList != null}">
                        <c:forEach var="character" items="${charactersList}">
                            <a class="list-group-item list-group-item-action active text-bg-light"
                               rel="noopener noreferrer">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="ms-1"><c:out value="${character.name}"/>
                                    </h5>
                                </div>
                                <div class="row gx-0" >
                                    <div class="col-lg-4 col-sm-4">
                                        <img src="${character.link}" width="250px" alt="...">
                                    </div>
                                    <div class="col-lg-8 col-sm-8">
                                        Информация: <c:out value="${character.info}"/>
                                        <br>
                                        Аниме: Тетрадь смерти
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
