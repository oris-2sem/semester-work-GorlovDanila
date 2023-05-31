package ru.itis.exeption;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/error")
public class MyErrorController implements ErrorController {

    private final Logger logger = LoggerFactory.getLogger(getClass());

   @GetMapping
    public String handleError(Model model, HttpServletRequest req) {
        Object status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "error_404_page";
            } else {
                logger.error(req.toString());
                model.addAttribute("errorCode", req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE));
                model.addAttribute("errorDesc", req.getAttribute(RequestDispatcher.ERROR_MESSAGE));
                return "error_page";
            }
        }
        return "error_page";
    }

    @PostMapping
    public String handleErrorFromJS(Model model,
                                    @RequestParam("Status-Code") String code,
                                    @RequestParam("Status-Message") String message) {
       model.addAttribute("errorCode", code);
       model.addAttribute("errorDesc", message.split(" ")[1]);
       return "error_page";
    }
}
