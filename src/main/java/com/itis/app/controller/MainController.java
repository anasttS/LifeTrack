package com.itis.app.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @GetMapping("/main")
    public ModelAndView getMainPage(Authentication authentication) {
        ModelAndView modelAndView = new ModelAndView();
        if (authentication != null) {
            modelAndView.setViewName("main");
        } else {
            modelAndView.setViewName("index");
        }
        return modelAndView;
    }
}
