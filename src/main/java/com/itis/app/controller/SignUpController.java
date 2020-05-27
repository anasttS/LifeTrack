package com.itis.app.controller;

import com.itis.app.dto.SignUpDto;
import com.itis.app.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

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
    public ModelAndView signUp(@Valid SignUpDto form,  BindingResult bindingResult) {
        System.out.println(bindingResult.getAllErrors());
        ModelAndView modelAndView = new ModelAndView();
        if(!bindingResult.hasErrors()){
            signUpService.signUp(form);
            modelAndView.setViewName("redirect:/signIn");
        }
        else{
           modelAndView.setViewName("signUp");
        }

        return modelAndView;
    }

}
