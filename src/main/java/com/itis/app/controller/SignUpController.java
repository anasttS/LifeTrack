package com.itis.app.controller;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.User;
import com.itis.app.service.SignUpService;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class SignUpController {

    @Autowired
    SignUpService signUpService;

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

    @PostMapping("/signUp")
    public ModelAndView signUp(SignUpDto form) {
        ModelAndView modelAndView = new ModelAndView();
        signUpService.signUp(form);
        modelAndView.setViewName("redirect:/signIn");
        return modelAndView;
    }

}
