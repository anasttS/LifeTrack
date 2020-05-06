package com.itis.app.filters;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class CustomFilter2 extends GenericFilterBean {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        String uri = ((HttpServletRequest) servletRequest).getRequestURI();
//        if (uri.contains("users")) {

        String hasAuthorityAdmin = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
        if (hasAuthorityAdmin.equals("[ADMIN]")) {
            System.out.println("Admin is on the page USERS");
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            System.out.println("User has not rights for this page");
            ((HttpServletResponse) servletResponse).sendRedirect("/profile");
        }

    }

}
