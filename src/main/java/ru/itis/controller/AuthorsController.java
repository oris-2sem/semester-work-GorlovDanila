package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import ru.itis.controller.api.AuthorsApi;
import ru.itis.dto.AuthorDto;
import ru.itis.dto.AuthorsPageDto;
import ru.itis.entity.Author;
import ru.itis.mapper.AuthorMapper;
import ru.itis.mapper.AuthorPageMapper;
import ru.itis.service.AuthorDataService;

@RequiredArgsConstructor
@RestController
@Slf4j
@RequestMapping(value = "/authors")
public class AuthorsController implements AuthorsApi {
    private final AuthorDataService authorDataService;
    private final AuthorMapper authorMapper;
    private final AuthorPageMapper authorPageMapper;

    @Override
    public ResponseEntity<AuthorsPageDto> getAuthors(Model model) {
        return ResponseEntity
                .ok(authorPageMapper.toDto(authorDataService.findAll()));
    }

    @Override
    public ResponseEntity<AuthorDto> addAuthor(@RequestParam("name") String name,
                                               @RequestParam("info") String info) {
        if (authorDataService.findByName(name) == null) {
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(authorMapper.toDto(authorDataService.saveApi(new Author(null, "/resources/images/working.jpg", name, info))));
        } else {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .build();
        }
    }

    @Override
    public ResponseEntity<AuthorDto> deleteAuthor(@RequestParam("id") Long id,
                                                  @RequestParam(value = "name", required = false) String name,
                                                  @RequestParam(value = "info", required = false) String info) {
        if (name == null && info == null) {
            return ResponseEntity
                    .status(HttpStatus.NON_AUTHORITATIVE_INFORMATION)
                    .build();
        }

        if (authorDataService.findById(id) != null) {
            Author author = authorDataService.findById(id);
            if (name != null)
                author.setName(name);
            if (info != null)
                author.setInfo(info);
            return ResponseEntity.ok(authorMapper.toDto(authorDataService.saveApi(author)));
        } else {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .build();
        }
    }

    @Override
    public ResponseEntity<AuthorDto> deleteAuthor(@RequestParam("id") Long id) {
        if (authorDataService.findById(id) != null) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(authorMapper.toDto(authorDataService.deleteById(id)));
        } else {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .build();
        }
    }

    @GetMapping
    public ModelAndView getScript() {
        return new ModelAndView("authors_script");
    }

    @GetMapping("/authors_page")
    public ModelAndView getAuthorsPage() {
        return new ModelAndView("authors_page");
    }

    @Override
    public ResponseEntity<AuthorsPageDto> filterByStartCareer() {
        return ResponseEntity
                .ok(authorPageMapper.toDto(authorDataService.filterByStartCareer()));
    }

    @Override
    public ResponseEntity<AuthorsPageDto> filterByEndCareer() {
        return ResponseEntity
                .ok(authorPageMapper.toDto(authorDataService.filterByEndCareer()));
    }
}
