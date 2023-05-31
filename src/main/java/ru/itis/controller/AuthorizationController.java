package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/authorization")
public class AuthorizationController {

    @GetMapping
    public String view() {
        return "authorization_page";
    }

}
