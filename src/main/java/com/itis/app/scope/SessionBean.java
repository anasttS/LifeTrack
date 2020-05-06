package com.itis.app.scope;

import com.itis.app.model.User;
import com.itis.app.security.details.UserDetailsImpl;
import org.springframework.security.core.Authentication;


public class SessionBean {

    public User getUser(Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        return user;
    }

}