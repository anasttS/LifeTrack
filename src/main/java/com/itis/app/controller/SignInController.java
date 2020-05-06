package com.itis.app.controller;

import com.itis.app.scope.CustomBean;
import com.itis.app.service.ConfirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignInController {


    @Autowired
    ConfirmService confirmService;

    @GetMapping("/signIn")
    public ModelAndView getSignInPage(Authentication authentication){
        ModelAndView modelAndView = new ModelAndView();
        if (authentication != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }

    @GetMapping("/activate")
    @Scope("custom")
    public String activate(Model model, @RequestParam("code") String code) {
        CustomBean customBean = new CustomBean();
        customBean.activate(code);
        boolean isActivated = confirmService.activateUser(code);
        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }
        return "redirect:/signIn";
    }

    @GetMapping("/signInError")
    public ModelAndView getSignInPageWithErrors(Authentication authentication){
        ModelAndView modelAndView = new ModelAndView();
        if (authentication != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            String error = "Try again! Email or password are incorrect";
            modelAndView.addObject("error", error);
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }

}
