package ru.itis.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.itis.mapper.GenrePageMapper;
import ru.itis.service.GenreDataService;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/genres")
public class GenresController {

    private final GenreDataService genreDataService;
    private final GenrePageMapper genrePageMapper;

    @GetMapping
    public String view(Model model) {
        model.addAttribute("genresList", genrePageMapper.toDto(genreDataService.findAll()));
        return "genres_page";
    }
}
