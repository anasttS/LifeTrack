package com.itis.app.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignInController {

    @GetMapping("/signIn")
    public ModelAndView getSignInPage(Authentication authentication){
        ModelAndView modelAndView = new ModelAndView();
        if (authentication != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            modelAndView.setViewName("signIn");
        };
        return modelAndView;
    }

}
