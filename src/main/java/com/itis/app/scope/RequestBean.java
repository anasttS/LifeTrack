package com.itis.app.scope;

import com.itis.app.model.User;
import com.itis.app.security.details.UserDetailsImpl;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

@RequestScope
@Component
public class RequestBean {
    private String data;

    public String getData(Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        data = "Admin is " + user.getUsername() + " " + user.getEmail() ;
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}