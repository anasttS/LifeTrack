package com.itis.app.controller;

import bell.oauth.discord.main.OAuthBuilder;
import com.itis.app.dto.SignUpDto;
import com.itis.app.model.Role;
import com.itis.app.model.State;
import com.itis.app.model.User;
import com.itis.app.scope.SessionBean;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.GraphicsService;
import com.itis.app.service.SignUpService;
import com.itis.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Collections;
import java.util.UUID;

@Controller
public class DiscordController {

    @Autowired
    OAuthBuilder builder;

    @Autowired
    UserService userService;

    @Autowired
    GraphicsService graphicsService;

    @Autowired
    SignUpService signUpService;

    @Autowired
    SessionBean sessionBean;

    @GetMapping("/signInDiscord")
    public ModelAndView getDiscordAuth(@RequestParam("code") String code) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        builder.exchange(code);
        bell.oauth.discord.domain.User userFromDis = builder.getUser();
        User user = userService.getUserByEmail(userFromDis.getEmail());
        if (user == null) {
            SignUpDto signUpDto = new SignUpDto();
            signUpDto.setEmail(userFromDis.getEmail());
            signUpDto.setUsername(userFromDis.getUsername());
            User user1 = signUpService.signUpDiscord(signUpDto);
            sessionBean.setUser(user1);
            graphicsService.saveChart(user1.getId());
            UserDetailsImpl userDetails = new UserDetailsImpl(user1);
            UsernamePasswordAuthenticationToken token
                    = new UsernamePasswordAuthenticationToken(userDetails, user1.getHashPassword(), userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(token);
            modelAndView.setViewName("redirect:/profile");
            return modelAndView;
        } else {
            UserDetailsImpl userDetails = new UserDetailsImpl(user);
            sessionBean.setUser(user);
            graphicsService.saveChart(user.getId());
            UsernamePasswordAuthenticationToken token
                    = new UsernamePasswordAuthenticationToken(userDetails, user.getHashPassword(), userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(token);
            modelAndView.setViewName("redirect:/profile");
            return modelAndView;
        }
    }
}

