package com.itis.app.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventsController {


    @GetMapping("/events")
    public ModelAndView getEventsPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("events");
        return modelAndView;
    }

}
