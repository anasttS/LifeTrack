package com.itis.app.controller;

import com.itis.app.dto.NoteDto;
import com.itis.app.scope.SessionBean;
import com.itis.app.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PreAuthorize("isAuthenticated()")
@Scope("pages")
public class NotesController {

    @Autowired
    NoteService noteService;

    @Autowired
    SessionBean sessionBean;

    @GetMapping("/notes")
    public ModelAndView getNotesPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",  sessionBean.getUser());
        modelAndView.addObject("notes", noteService.getNotesByUser_id(sessionBean.getUser().getId()));
        modelAndView.setViewName("notes");
        return modelAndView;
    }

    @PostMapping("/addNote")
    public ModelAndView addNote(NoteDto noteDto){
        ModelAndView modelAndView = new ModelAndView();
        //modelAndView.addObject("user",  sessionBean.getUser());
        noteService.addNote(noteDto, sessionBean.getUser().getId() );
        modelAndView.setViewName("redirect:/notes");
        return modelAndView;
    }
}
