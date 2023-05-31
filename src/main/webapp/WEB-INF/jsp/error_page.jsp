<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 16:48
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
  "
/>
<head id="head">
    <c:set var="title" value="Error"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
</head>
<body id="body" style="overflow: hidden;">
<jsp:include page="header.jsp"/>
<section class="main-content" style="background-color: black;">
    <div class="container-fluid">
        <div class="row" id="code">
            <h1 style="color: white; margin-top: 20px; text-align: center"><c:out value="${errorCode}"/></h1>
        </div>
        <div class="row" id="desc">
            <h1 style="color: white; text-align: center"><c:out value="${errorDesc}"/></h1>
        </div>
        <div class="row">
            <img src="${pageContext.request.contextPath}/resources/images/error.jpg" alt="..." style="width: auto; height: 550px; display: block; margin-left: auto; margin-right: auto">
        </div>
    </div>
</section>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>
