package com.itis.app.handler;


import com.itis.app.scope.SessionBean;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.service.GraphicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    SessionBean sessionBean;

    @Autowired
    GraphicsService graphicsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        sessionBean.setUser(userDetails.getUser());
        graphicsService.saveChart(userDetails.getUser().getId());
        httpServletResponse.sendRedirect("/profile");
    }
}
