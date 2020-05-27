package com.itis.app.controller;

//import com.itis.app.scope.customScope.CustomBean;
import com.itis.app.scope.SessionBean;
import com.itis.app.service.ConfirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignInController {


    @Autowired
    SessionBean sessionBean;

    @Autowired
    ConfirmService confirmService;

//    @Autowired
//    CustomBean bean;

    @RequestMapping(value = {"/signIn"}, method = RequestMethod.GET)
    public ModelAndView getSignInPage(){
        ModelAndView modelAndView = new ModelAndView();
        if (sessionBean.getUser() != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }


    @RequestMapping(value = {"/signIn?"}, method = RequestMethod.GET)
    public ModelAndView getSignInPageWithMessage(@RequestParam String message){
        ModelAndView modelAndView = new ModelAndView();
        if (sessionBean.getUser() != null) {
            modelAndView.setViewName("redirect:/profile");
        } else {
            modelAndView.addObject("message", message);
            modelAndView.setViewName("signIn");
        }
        return modelAndView;
    }

    @GetMapping("/activate")
//    @Scope("custom")
    public ModelAndView activate(@RequestParam("code") String code) {
        ModelAndView modelAndView = new ModelAndView();
//        bean.activate();
        boolean isActivated = confirmService.activateUser(code);
        if (isActivated) {
            modelAndView.addObject("message", "User is successfully activated");
        } else {
            modelAndView.addObject("message", "Activation code is not found!");
        }
        modelAndView.setViewName("redirect:/signIn");
        return modelAndView;
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
