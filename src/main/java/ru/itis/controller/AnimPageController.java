package ru.itis.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.itis.entity.Anim;
import ru.itis.entity.User;
import ru.itis.service.AnimDataService;
import ru.itis.service.UserDataService;

import java.security.Principal;
import java.util.Objects;
import java.util.Set;

@RequiredArgsConstructor
@Controller
@Slf4j
@RequestMapping(value = "/title/{id}")
public class AnimPageController {

    private final AnimDataService animDataService;
    private final UserDataService userDataService;

    @GetMapping
    public String view(@PathVariable Long id,
                       Model model, Principal principal) {

        User user = userDataService.findByLogin(principal.getName());
        Set<Anim> viewed = user.getAnims();

        if (viewed.size() > 0) {
            boolean flagUnic = true;
            for (Anim anim : viewed) {
                if (Objects.equals(id, anim.getId())) {
                    flagUnic = false;
                    break;
                }
            }
            if (flagUnic) {
                viewed.add(animDataService.findById(id));
            }
        } else {
            viewed.add(animDataService.findById(id));
        }

        user.setAnims(viewed);
        userDataService.save(user);

        model.addAttribute("myAnimEntity", animDataService.findById(id));

        return "anime_page";
    }
}
