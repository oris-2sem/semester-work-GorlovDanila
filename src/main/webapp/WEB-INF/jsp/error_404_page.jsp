<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';
    img-src 'self';
  "
/>
<head id="head">
    <c:set var="title" value="404"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
</head>
<body id="body" style="overflow: hidden;">
<jsp:include page="header.jsp"/>
<section class="main-content" style="background-color: black">
    <div class="container-fluid">
        <div class="row">
                <img src="${pageContext.request.contextPath}/resources/images/404.jpg" alt="..." width="1840" height="650" style="margin-top: 15px">
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
