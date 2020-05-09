package com.itis.app.scope;

import com.itis.app.model.User;



public class SessionBean {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        System.out.println("User is set");
        this.user = user;
    }

}