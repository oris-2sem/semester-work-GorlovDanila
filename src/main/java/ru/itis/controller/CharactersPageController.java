package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.itis.service.CharacterDataService;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/characters")
public class CharactersPageController {

    private final CharacterDataService characterDataService;

    @GetMapping
    public String getView(Model model) {
        model.addAttribute("charactersList", characterDataService.findAll());
        return "characters_page";
    }
}
