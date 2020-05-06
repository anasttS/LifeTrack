package com.itis.app.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PreAuthorize("isAuthenticated()")
public class HabitsController {


    @GetMapping("/habits")

    public ModelAndView getHabitsPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("habits");
        return modelAndView;
    }
}
