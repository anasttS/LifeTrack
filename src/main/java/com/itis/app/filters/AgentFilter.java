package com.itis.app.filters;

import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class AgentFilter extends GenericFilterBean {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        String agent = httpRequest.getHeader("User-Agent");

        if (!agent.contains("Mobile")) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            throw new IllegalArgumentException();
        }
    }

}
