package com.itis.app.controller;


import com.itis.app.scope.SessionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportController {

    @Autowired
    SessionBean sessionBean;


    @GetMapping("/chat")
    public String getIndexPage(Model model) {
        model.addAttribute("user", sessionBean.getUser());
        model.addAttribute("pageId", sessionBean.getUser().getConfirmCode());
        return "chat";
    }
}
