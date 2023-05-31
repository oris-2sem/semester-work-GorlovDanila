<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:choose><c:when test="${not empty param.title}">${param.title}</c:when><c:otherwise>Заголовок страницы по умолчанию</c:otherwise></c:choose></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
      rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/50e3c0bd8c.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/f93f6752bd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/dompurify@2.3.2/dist/purify.min.js"></script>
</html>
