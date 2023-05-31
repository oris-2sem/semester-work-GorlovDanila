<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="liveToast2" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
    <div class="toast-header">
      <img src="${pageContext.request.contextPath}/resources/logos/logo.png" alt="..." class="rounded me-2">
      <button type="button" class="btn-close my-toast" data-bs-dismiss="toast" aria-label="Закрыть"></button>
    </div>
    <div class="toast-body">
      <c:choose><c:when test="${not empty param.text}">${param.text}</c:when><c:otherwise>Текст тоста по умолчанию</c:otherwise></c:choose>
<%--      Вас перекинет на страницу регистрации, если пользователь с такими данными не существует!--%>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/toast.js" rel="script"></script>
</html>
