package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.itis.service.AnimDataService;
import ru.itis.service.AuthorDataService;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/admin")
public class AdminPageController {

    private final AnimDataService animDataService;
    private final AuthorDataService authorDataService;

    @GetMapping
    public ModelAndView getScript() {
        return new ModelAndView("admin_script");
    }

    @GetMapping("/admin_page")
    public ModelAndView getView() {
        ModelAndView modelAndView = new ModelAndView("admin_page");
        modelAndView.addObject("authorList", authorDataService.findAll());
        modelAndView.addObject("animList", animDataService.findAll());
        return modelAndView;
    }
}
