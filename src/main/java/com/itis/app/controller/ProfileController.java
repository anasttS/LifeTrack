package com.itis.app.controller;

import com.itis.app.model.User;
import com.itis.app.scope.SessionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PreAuthorize("isAuthenticated()")
@SessionScope
public class ProfileController {

    @Autowired
    SessionBean sessionBean;

//    @Autowired
//    CustomBean customBean;

//    @Autowired
//    UpdateInfoService updateInfoService;

    @GetMapping("/profile")

    public ModelAndView getProfilePage(Authentication authentication, Model model){
        User user = sessionBean.getUser(authentication);
//        customBean.createUserSession(authentication);
        model.addAttribute("user", user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("profile");
        return modelAndView;
    }

//    @PostMapping("/profile")
//    public String updateInfo(UpdateDto form, Model model){
//        User user = updateInfoService.updateInfo(form);
//        model.addAttribute("user", user);
//        return "redirect:/profile";
//    }

}
