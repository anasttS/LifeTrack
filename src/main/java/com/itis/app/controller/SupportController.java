package com.itis.app.controller;


import com.itis.app.dto.MessageDto;
import com.itis.app.scope.SessionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Scope("pages")
public class SupportController {

    @Autowired
    SessionBean sessionBean;

    @GetMapping("/support")
    public String getChat(Model model){
        model.addAttribute("user", sessionBean.getUser());
        model.addAttribute("name", sessionBean.getUser().getUsername());
        return "chat";
    }

}

