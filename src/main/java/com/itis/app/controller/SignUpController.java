package com.itis.app.controller;

import com.itis.app.dto.SignUpDto;
import com.itis.app.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpController {

    @Autowired
    SignUpService signUpService;

    @PreAuthorize("permitAll()")
    @GetMapping("/signUp")
    public ModelAndView getSignUpPage(Authentication authentication) {
        ModelAndView modelAndView = new ModelAndView();
        if (authentication != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            modelAndView.setViewName("signUp");
        }
        return modelAndView;
    }
    @PreAuthorize("permitAll()")
    @PostMapping("/signUp")
    public ModelAndView signUp(SignUpDto form) {
        ModelAndView modelAndView = new ModelAndView();
        signUpService.signUp(form);
        modelAndView.setViewName("redirect:/signIn");
        return modelAndView;
    }

}
