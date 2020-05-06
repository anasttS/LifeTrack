package com.itis.app.security;

import com.itis.app.model.User;
import com.itis.app.scope.SessionBean;
import com.itis.app.security.details.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyAuthenticationHandler implements AuthenticationSuccessHandler {

    private SessionBean sessionBean;

    public MyAuthenticationHandler(SessionBean sessionBean) {
        this.sessionBean = sessionBean;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        sessionBean.setUser(user);
        httpServletResponse.sendRedirect("profile");
    }
}
