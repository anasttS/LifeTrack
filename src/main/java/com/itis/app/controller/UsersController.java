package com.itis.app.controller;

import com.itis.app.dto.UserDto;
//import com.itis.app.scope.customScope.CustomBean;
import com.itis.app.scope.RequestBean;
import com.itis.app.scope.SessionBean;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UsersController {

    @Autowired
    RequestBean myRequestBean;

    @Autowired
    SessionBean bean;

    @Autowired
    UserService userService;

    @GetMapping("/delete")
    @PreAuthorize("hasAuthority('ADMIN')")
//    @Scope("custom")
    public ModelAndView delete(@RequestParam Long id){
//        bean.deactivate();
        ModelAndView modelAndView = new ModelAndView();
        userService.delete(id);
        modelAndView.setViewName("redirect:/users");
        return modelAndView;
    }

    @GetMapping("/changeRole")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView changeRole(@RequestParam Long id){
        ModelAndView modelAndView = new ModelAndView();
        userService.changeRole(id);
        modelAndView.setViewName("redirect:/users");
        return modelAndView;
    }

    @GetMapping("/users")
    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestScope
//    @Scope("custom")
    public ModelAndView getUsersPage(Authentication authentication, Model model) {
 //       System.out.println(myRequestBean.getData(authentication));
//        System.out.println("Count of activated users" + bean.getCount());
        ModelAndView modelAndView = new ModelAndView();
        if(authentication != null){
        List<UserDto> users = userService.getAllUsers();
        model.addAttribute("user", bean.getUser());
        model.addAttribute("users", users);
        modelAndView.setViewName("users");
        } else {
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }

}
