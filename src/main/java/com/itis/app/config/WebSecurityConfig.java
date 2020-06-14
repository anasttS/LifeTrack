package com.itis.app.config;

import com.itis.app.filters.CustomFilter;

import com.itis.app.handler.LoginSuccessHandler;
import com.itis.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    LoginSuccessHandler authenticationSuccessHandler;

    @Autowired
    @Qualifier(value = "customUserDetailsService")
    private UserDetailsService userDetailsService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.addFilterAfter(new CustomFilter(), FilterSecurityInterceptor.class);

        http.authorizeRequests()
                .antMatchers("/signUp").permitAll()
                .antMatchers("/main").permitAll()
                .antMatchers("/activate/**").permitAll()
                .antMatchers("/addEvent").authenticated()
                .antMatchers("/chat").authenticated()
                .antMatchers("/support").authenticated();

        http.formLogin()
                .loginPage("/signIn")
                .usernameParameter("email")
                .defaultSuccessUrl("/profile")
                .successHandler(authenticationSuccessHandler)
                .failureUrl("/signInError")
                .permitAll();


        http.rememberMe().tokenValiditySeconds(2592000).key("it's me").rememberMeParameter("checkRememberMe");


        http.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .deleteCookies("SESSION", "remember-me")
                .logoutSuccessUrl("/signIn");

    }


    @Autowired
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

}