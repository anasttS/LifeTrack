package com.itis.app.controller;

import com.itis.app.dto.EventDto;
import com.itis.app.model.Event;
import com.itis.app.scope.SessionBean;
import com.itis.app.service.EventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@PreAuthorize("isAuthenticated()")
@Scope("pages")
public class EventsController {

    @Autowired
    EventsService eventsService;

    @Autowired
    SessionBean sessionBean;

    @GetMapping("/events")
    public ModelAndView getEventsPage(){
        ModelAndView modelAndView = new ModelAndView();
        ArrayList<Event> events = eventsService.getEventsByUser_id(sessionBean.getUser().getId());
        modelAndView.addObject("user", sessionBean.getUser());
        modelAndView.addObject("events", events);
        modelAndView.setViewName("events");
        return modelAndView;
    }

    @PostMapping("/addEvent")
    public ModelAndView addEvent(EventDto form){
        ModelAndView modelAndView = new ModelAndView();
        eventsService.addEvent(form, sessionBean.getUser().getId());
        modelAndView.setViewName("redirect:/events");
        return modelAndView;
    }

    @GetMapping("/deleteEvent")
    public ModelAndView deleteEvent(@RequestParam Long id){
        ModelAndView modelAndView = new ModelAndView();
        eventsService.deleteEvent(id);
        modelAndView.setViewName("redirect:/events");
        return modelAndView;
    }

}
