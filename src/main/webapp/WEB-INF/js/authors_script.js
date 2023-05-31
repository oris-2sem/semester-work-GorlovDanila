fetch('/authors/authors_page')
    .then(response => response.text())
    .then(html => {
        // здесь вы можете использовать полученный HTML код
        console.log(html);
        // например, вставить его в элемент на странице
        document.getElementById('myDiv').innerHTML = html;
    })
    .catch(error => console.error(error));