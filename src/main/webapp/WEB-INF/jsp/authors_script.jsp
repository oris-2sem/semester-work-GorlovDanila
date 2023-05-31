<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html id="html">
<script>
    fetch('/authors/authors_page')
        .then(response1 => response1.text())
        .then(html => {
            document.getElementById('html').innerHTML = html;
            return fetch('/authors/get')
                .then(response2 => response2.json())
                .then(data => {
                        const authorsList = document.getElementById("authors-list");

                        data.authorDtoList.forEach(author => {
                            console.log(author)
                            const myLi = document.createElement("li");
                            myLi.innerHTML = '<div class="row gx-0">' +
                                '<div class="col-lg-4 col-sm-4" id="img">' +
                                '<img src="' + author.linkToImage + '" width="250px" alt="...">' +
                                '</div>' +
                                '<div class="col-lg-8 col-sm-8" id="info">' +
                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                '<p>' + author.name + '</p>' +
                                '<p>' + author.info + '</p>' +
                                '</a>' +
                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                '<p>' + "Работы автора, представленные на сайте:" + " " + author.anims + '</p>' +
                                '</a>' +
                                '</div>' +
                                '</div>' +
                                '<br>';
                            authorsList.appendChild(myLi);
                        })

                        function myStartClick() {
                            fetch('/authors/get/filter-by-start-career')
                                .then(response3 => response3.json())
                                .then(data => {
                                        const authorsList = document.getElementById("authors-list");

                                        for (let i = 0; i < data.authorDtoList.length; i++) {
                                            const li = document.createElement("li");
                                            li.innerHTML =
                                                '<div class="row gx-0">' +
                                                '<div class="col-lg-4 col-sm-4" id="img">' +
                                                '<img src="' + data.authorDtoList[i].linkToImage + '" width="250px" alt="...">' +
                                                '</div>' +
                                                '<div class="col-lg-8 col-sm-8" id="info">' +
                                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                                '<p>' + data.authorDtoList[i].name + '</p>' +
                                                '<p>' + data.authorDtoList[i].info + '</p>' +
                                                '</a>' +
                                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                                '<p>' + "Работы автора, представленные на сайте:" + " " + data.authorDtoList[i].anims + '</p>' +
                                                '</a>' +
                                                '</div>' +
                                                '</div>' +
                                                '<br>';
                                            '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' + '<p>' + data.authorDtoList[i].name + '</p>' + '<p>' + data.authorDtoList[i].info + '</p>' + '</a>'
                                            authorsList.replaceChild(li, authorsList.children[i])
                                            console.log( authorsList.childElementCount)
                                        }
                                    authorsList.removeChild(authorsList.children[7])
                                    }
                                )
                                .catch(error => console.log(error))
                        }

                        document.getElementById("clickStartFilter").onclick = myStartClick;

                        function myEndClick() {
                            fetch('/authors/get/filter-by-end-career')
                                .then(response3 => response3.json())
                                .then(data => {
                                        const authorsList = document.getElementById("authors-list");

                                        for (let i = 0; i < data.authorDtoList.length; i++) {
                                            const li = document.createElement("li");
                                            li.innerHTML =
                                                '<div class="row gx-0">' +
                                                '<div class="col-lg-4 col-sm-4" id="img">' +
                                                '<img src="' + data.authorDtoList[i].linkToImage + '" width="250px" alt="...">' +
                                                '</div>' +
                                                '<div class="col-lg-8 col-sm-8" id="info">' +
                                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                                '<p>' + data.authorDtoList[i].name + '</p>' +
                                                '<p>' + data.authorDtoList[i].info + '</p>' +
                                                '</a>' +
                                                '<a class="list-group-item list-group-item-action text-bg-light active" rel="noopener noreferrer">' +
                                                '<p>' + "Работы автора, представленные на сайте:" + " " + data.authorDtoList[i].anims + '</p>' +
                                                '</a>' +
                                                '</div>' +
                                                '</div>' +
                                                '<br>';
                                            console.log(li)
                                            authorsList.replaceChild(li, authorsList.children[i])
                                        }
                                    }
                                )
                                .catch(error => console.log(error))
                        }

                        document.getElementById("clickEndFilter").onclick = myEndClick;

                    }
                )

        })
        .catch(error => console.error(error));
</script>
</html>
