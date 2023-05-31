package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.entity.Author;
import ru.itis.service.AuthorDataService;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/admin/author")
public class AdminAuthorController {

    private final AuthorDataService authorDataService;

    @PostMapping
    public String logic(@RequestParam(value = "nameDeleteAuthor", required = false) String nameDeleteAuthor,
                        @RequestParam(value = "NameLastAuthor", required = false) String lastNameAuthor,
                        @RequestParam(value = "NameNewAuthor", required = false) String newNameAuthor,
                        @RequestParam(value = "InfoLastAuthor", required = false) String lastInfoAuthor,
                        @RequestParam(value = "InfoNewAuthor", required = false) String newInfoAuthor,
                        @RequestParam(value = "newNameAuthor", required = false) String nameNewAuthor,
                        @RequestParam(value = "newInfoAuthor", required = false) String infoNewAuthor) {

        if (nameNewAuthor != null && infoNewAuthor!= null) {
            if(authorDataService.findByName(nameNewAuthor) == null) {
                authorDataService.save(new Author(null, null, nameNewAuthor, infoNewAuthor));
            }
        }

        if (nameDeleteAuthor != null && !nameDeleteAuthor.equals("Выберите имя автора для удаления")) {
            authorDataService.deleteByName(nameDeleteAuthor);
        }

        if (!lastNameAuthor.equals("Выберите имя автора для изменения") && newNameAuthor != null) {
            Author author = authorDataService.findByName(lastNameAuthor);
            author.setName(newNameAuthor);
            authorDataService.save(author);
        }

        if (!lastInfoAuthor.equals("Выберите информацию об авторе для изменения") && newInfoAuthor != null) {
            Author author = authorDataService.findByInfo(lastInfoAuthor);
            author.setInfo(newInfoAuthor);
            authorDataService.save(author);
        }
        return "redirect:/admin";
    }
}
