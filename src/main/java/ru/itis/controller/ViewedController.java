package ru.itis.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.itis.entity.Anim;
import ru.itis.entity.User;
import ru.itis.service.UserDataService;

import java.security.Principal;
import java.util.Set;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/viewed")
public class ViewedController {

    private UserDataService userDataService;

    @GetMapping
    public String view(Model model, Principal principal) {
        User user = userDataService.findByLogin(principal.getName());
        Set<Anim> viewed = user.getAnims();
        model.addAttribute("listViewed", viewed);
        return "viewed_page";
    }
}
