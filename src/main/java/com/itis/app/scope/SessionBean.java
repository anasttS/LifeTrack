package com.itis.app.scope;

import com.itis.app.model.User;
import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@SessionScope
@Data
@Component
public class SessionBean {
    private User user;
}