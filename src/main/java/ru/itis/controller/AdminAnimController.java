package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.entity.Anim;
import ru.itis.entity.Author;
import ru.itis.entity.Genre;
import ru.itis.service.AnimDataService;
import ru.itis.service.AuthorDataService;
import ru.itis.service.GenreDataService;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/admin/anim")
public class AdminAnimController {

    private final AnimDataService animDataService;
    private final GenreDataService genreDataService;
    private final AuthorDataService authorDataService;

    @PostMapping
    public String logic(@RequestParam(value = "nameNewAuthor", required = false) String nameNewAuthor,
                        @RequestParam(value = "titleNewAnime", required = false) String titleNewAnim,
                        @RequestParam(value = "newAnimeGenre", required = false) List<String> genresNewAnim,
                        @RequestParam(value = "yearNewAnime", required = false) Long yearNewAnim,
                        @RequestParam(value = "typeNewAnime", required = false) String typeNewAnim,
                        @RequestParam(value = "statusNewAnime", required = false) String statusNewAnim,
                        @RequestParam(value = "titleAnimeDelete", required = false) String titleDeleteAnim,
                        @RequestParam(value = "lastTitleAnime", required = false) String lastTitleAnim,
                        @RequestParam(value = "newTitleAnime", required = false) String newTitleAnim) {

        if (nameNewAuthor != null && !nameNewAuthor.equals("")) {
            if (authorDataService.findByName(nameNewAuthor) == null) {
                String info = nameNewAuthor + " info";
                authorDataService.save(new Author(null, "/resources/images/working.jpg", nameNewAuthor, info));
            }
        }

        if (genresNewAnim != null && genresNewAnim.size() != 0 && !genresNewAnim.get(0).equals("")) {
            for (String genreTitle : genresNewAnim) {
                if (genreDataService.findByName(genreTitle) == null) {
                    String info = genreTitle + " info";
                    genreDataService.save(new Genre(null, genreTitle, info));
                }
            }
        }

        if (titleNewAnim != null && nameNewAuthor != null && genresNewAnim != null && genresNewAnim.size() != 0 && yearNewAnim != null && typeNewAnim != null && statusNewAnim != null) {
            if (animDataService.findByTitle(titleNewAnim) == null) {
                Set<Genre> genres = new HashSet<>();
                for (String genreTitle : genresNewAnim) {
                    genres.add(genreDataService.findByName(genreTitle));
                }
                animDataService.save(new Anim(null, titleNewAnim, authorDataService.findByName(nameNewAuthor), "/resources/videos/miku.mp4", "/resources/images/working.jpg", yearNewAnim, typeNewAnim, statusNewAnim, genres));
            }
        }

        if (titleDeleteAnim != null && !titleDeleteAnim.equals("Выберите название аниме для удаления")) {
            animDataService.deleteByTitle(titleDeleteAnim);
        }

        if (lastTitleAnim != null && newTitleAnim != null && !lastTitleAnim.equals("Выберите название аниме для изменения") && !newTitleAnim.equals("")) {
            Anim anim = animDataService.findByTitle(lastTitleAnim);
            anim.setTitle(newTitleAnim);
            animDataService.save(anim);
        }
        return "redirect:/admin";
    }
}
