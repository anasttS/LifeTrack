package com.itis.app;

//import com.itis.app.scope.customScope.CustomBeanFactoryPostProcessor;

import bell.oauth.discord.main.OAuthBuilder;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itis.app.scope.customScope.PagesBeanFactoryPostProcessor;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.context.annotation.ApplicationScope;


@SpringBootApplication
public class LifeTrackApplication {

    @Bean
    public OAuthBuilder oAuthBuilder() {
        OAuthBuilder builder = new OAuthBuilder("710111299459088434", "KLapPRYpmTaaj1b58C1UGVQYMv0VvJtG")
                .setScopes(new String[]{"connections", "guilds", "email"})
                .setRedirectURI("http://localhost:8080/signInDiscord");
        return builder;
    }

    @Bean
    public static BeanFactoryPostProcessor beanFactoryPostProcessor() {
        return new PagesBeanFactoryPostProcessor();
    }

    @Bean
    public ObjectMapper objectMapper() {
        return new ObjectMapper();
    }

    @Bean
    @ApplicationScope
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    public static void main(String[] args) {
        SpringApplication.run(LifeTrackApplication.class, args);
    }

}
