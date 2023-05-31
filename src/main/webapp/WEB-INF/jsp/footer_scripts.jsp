<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 06.05.2023
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <script>
        id="clickStartFilter"
        function clean() {
            const head = document.getElementById("head").innerHTML;
            document.getElementById("head").innerHTML = DOMPurify.sanitize(head, null);

            const body = document.getElementById("body").innerHTML;
            document.getElementById("body").innerHTML = DOMPurify.sanitize(body, null);
        }
        document.getElementById("clickClean").onclick = clean;
    </script>
</footer>
</html>
