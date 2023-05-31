package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.entity.User;
import ru.itis.service.OkHttpDataService;
import ru.itis.service.UserDataService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/registration")
public class RegistrationController {

    private final UserDataService userDataService;

    private final OkHttpDataService okHttpDataService;

    @GetMapping
    public String view(Model model, HttpServletRequest req) {
        if (req.getServletContext().getAttribute("error") != null) {
            model.addAttribute("error", req.getServletContext().getAttribute("error"));
        }
        return "registration_page";
    }

    @PostMapping
    public String registration(@RequestParam("personLogin") String login,
                               @RequestParam("personPassword") String password,
                               @RequestParam("personNumber") String number,
                               HttpServletRequest request) {

        if (okHttpDataService.checkValidNumber(number)) {
            if (!userDataService.save(new User(null, login, password, number, null, new HashSet<>())))
                return "redirect:/authorization";
        } else {
            request.getServletContext().setAttribute("error", "Введите корректный номер телефона");
            return "redirect:/registration";
        }
        return "redirect:/";
    }
}
