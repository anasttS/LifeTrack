package com.itis.app.scope;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.context.annotation.SessionScope;

@Configuration
public class ScopesConfig {

    @Bean
    @RequestScope
    public RequestBean requestScopedBean() {
        return new RequestBean();
    }

    @Bean
    @SessionScope
    public SessionBean sessionScopedBean() {
        return new SessionBean();
    }

    @Bean
    public CustomBean customScopedBean() {
        return new CustomBean();
    }

}
