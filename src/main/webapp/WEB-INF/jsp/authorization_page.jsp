<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 17.10.2022
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<meta
        http-equiv="Content-Security-Policy"
        content="
    script-src 'self' https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/ https://code.jquery.com/;
    style-src 'self' https://fonts.googleapis.com https://cdn.jsdelivr.net/npm https://kit.fontawesome.com/ https://use.fontawesome.com/ https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css 'unsafe-inline';
    img-src 'self' data: 'unsafe-inline';
  "
/>
<head id="head">
    <c:set var="title" value="Авторизация"/>
    <jsp:include page="head_scripts_and_styles.jsp">
        <jsp:param name="title" value="${title}"/>
    </jsp:include>
    <link href="${pageContext.request.contextPath}/resources/css/authorization_page.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body class="text-center" id="body">

<jsp:include page="header.jsp"/>
<main class="form-signin">
    <form method="post">
        <sec:csrfInput />
        <img class="mb-4" src="${pageContext.request.contextPath}/resources/logos/girl-160326.svg" alt="" width="100">
        <h1 class="h3 mb-3 fw-normal">Форма входа</h1>
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com"
                   name="personLogin">
            <label for="floatingInput">Login</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="personPassword">
            <label for="floatingPassword">Password</label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Войти</button>
    </form>
</main>
<c:set var="text" value="Вас перекинет на страницу регистрации, если пользователь с такими данными не существует!"/>
<jsp:include page="toast.jsp">
    <jsp:param name="text" value="${text}"/>
</jsp:include>
<jsp:include page="footer_scripts.jsp"/>
</body>
</html>

