package ru.itis.exeption;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@ControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(Exception.class)
    public ModelAndView handleAllExceptions(Exception ex) {
        log.error(String.valueOf(ex));
        ModelAndView mav = new ModelAndView("error_page");
        mav.addObject("errorCode", 500);
        mav.addObject("errorDesc", HttpStatus.INTERNAL_SERVER_ERROR);
        return mav;
    }
}
