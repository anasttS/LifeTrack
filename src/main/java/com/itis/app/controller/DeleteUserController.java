package com.itis.app.controller;

import com.itis.app.scope.CustomBean;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DeleteUserController {

    @Autowired
    UserService userService;

    @Autowired
    CustomBean bean;

    @GetMapping("/delete")
    @Scope("custom")
    public ModelAndView delete(@RequestParam Long id){
//        CustomBean customBean = new CustomBean();
        bean.deactivate(userService.getCodeFromUserByUserId(id));
        ModelAndView modelAndView = new ModelAndView();
        userService.delete(id);
        modelAndView.setViewName("/signIn");
        return modelAndView;
    }
}
