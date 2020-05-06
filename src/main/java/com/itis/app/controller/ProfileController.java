package com.itis.app.controller;

import com.itis.app.dto.UpdateDto;
import com.itis.app.model.User;
import com.itis.app.scope.RequestBean;
import com.itis.app.scope.SessionBean;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.UpdateInfoService;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Controller
public class ProfileController {

    @Autowired
    SessionBean sessionBean;

//    @Autowired
//    UpdateInfoService updateInfoService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/profile")
    public ModelAndView getProfilePage(Model model){
        User user = sessionBean.getUser();
        System.out.println(user);
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
