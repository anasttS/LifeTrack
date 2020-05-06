package com.itis.app.controller;

import com.itis.app.dto.UserDto;
import com.itis.app.model.User;
import com.itis.app.scope.RequestBean;
import com.itis.app.scope.SessionBean;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Scope("custom")
public class UsersController {

    @Autowired
    RequestBean myRequestBean;

    @Autowired
    UserService userService;

    @GetMapping("/users")
    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestScope
    public ModelAndView getUsersPage(Authentication authentication, Model model) {
        System.out.println(myRequestBean.getData(authentication));
        ModelAndView modelAndView = new ModelAndView();
        if(authentication != null){
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("users", users);
        modelAndView.setViewName("users");
        } else {
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }

}
