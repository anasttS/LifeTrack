package com.itis.app.controller;

import com.itis.app.dto.UpdateDto;
import com.itis.app.model.Note;
import com.itis.app.model.User;
import com.itis.app.scope.SessionBean;
import com.itis.app.service.GraphicsService;
import com.itis.app.service.NoteService;
import com.itis.app.service.UpdateProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;

@Controller
@PreAuthorize("isAuthenticated()")
public class ProfileController {

    @Autowired
    UpdateProfileService updateProfileService;

    @Autowired
    GraphicsService graphicsService;


    @Autowired
    NoteService noteService;

    @Autowired
    SessionBean sessionBean;


    @GetMapping("/profile")
    public ModelAndView getProfilePage() {
        User user = sessionBean.getUser();
        ModelAndView modelAndView = new ModelAndView();
        graphicsService.saveChart(user.getId());
        ArrayList<Note> notesMonthAgo = noteService.getNotesByUser_idMonthAgo(sessionBean.getUser().getId());
        modelAndView.addObject("user", user);
        if (notesMonthAgo.size() != 0) {
            modelAndView.addObject("notesMonthAgo", notesMonthAgo);
        } else {
            modelAndView.addObject("message", "Нет записей месяц назад");
        }
        ArrayList<Note> notesYearAgo = noteService.getNotesByUser_idYearAgo(sessionBean.getUser().getId());
        if (notesYearAgo.size() != 0) {
            modelAndView.addObject("notesYearAgo", notesYearAgo);
        } else {
            modelAndView.addObject("messageYear", "Нет записей год назад");
        }

        modelAndView.addObject("img", "assets/img/charts/chart" + user.getId() + ".png");
        modelAndView.setViewName("profile");
        return modelAndView;
    }


    @PostMapping("/updateProfile")
    @PutMapping("/updateProfile")
    public ModelAndView updateInfo(UpdateDto form) {
        ModelAndView modelAndView = new ModelAndView();
        updateProfileService.updateProfile(form, sessionBean.getUser().getId());
        modelAndView.setViewName("redirect:/profile");
        return modelAndView;
    }

}
