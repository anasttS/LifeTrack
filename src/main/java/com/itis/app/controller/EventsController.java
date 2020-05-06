package com.itis.app.controller;

import com.itis.app.dto.EventDto;
import com.itis.app.model.Event;
import com.itis.app.model.User;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.EventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@PreAuthorize("isAuthenticated()")
public class EventsController {

    @Autowired
    EventsService eventsService;

    @GetMapping("/events")

    public ModelAndView getEventsPage(Authentication authentication, Model model){
        ModelAndView modelAndView = new ModelAndView();
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        ArrayList<Event> events = eventsService.getEventsByUser_id(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("events", events);
        modelAndView.setViewName("events");
        return modelAndView;
    }

    @PostMapping("/events")
    public String addEvent(Authentication authentication, EventDto form){
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        eventsService.addEvent(form, user.getId());
        return "redirect:/events";
    }

}
