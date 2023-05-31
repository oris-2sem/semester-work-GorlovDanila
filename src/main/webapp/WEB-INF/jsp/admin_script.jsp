<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 07.05.2023
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html id="html">
<script>
    fetch('/admin/admin_page')
        .then(response => {
            console.log(response)
            if (response.status === 200) {
                return response
            } else {
                throw new Error(response.status + ' ' + response.statusText);
            }
        })
        .then(response => response.text())
        .then(html => {
            // const html = new DOMParser().parseFromString(htmlText, 'text/html');
            document.getElementById('html').innerHTML = html;
        })
        .catch(error => {
            console.log(error.message)

            const params = new URLSearchParams();
            params.append('Status-Code', error.message.split(" ")[0]);
            params.append('Status-Message', error.message.split(" ")[1]);

            const options = {
                method: 'POST',
                body: params,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            };

            return fetch('/error', options)
                    .then(response => response.text())
                    .then(data =>  {
                        document.getElementById('html').innerHTML = data;
                    })
                    .catch(error => console.error(error));
        });
</script>
</html>
