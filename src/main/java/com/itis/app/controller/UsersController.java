package com.itis.app.controller;

import com.itis.app.dto.UserDto;
import com.itis.app.model.User;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UsersController {

    @Autowired
    UserService userService;

    @GetMapping("/users")

    public ModelAndView getUsersPage(Authentication authentication, Model model) {
        ModelAndView modelAndView = new ModelAndView();
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("users", users);
        if (user.getRole().toString().equals("ADMIN")) {
            modelAndView.setViewName("users");
        }
        return modelAndView;
    }


}
