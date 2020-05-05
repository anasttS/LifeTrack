package com.itis.app.filters.config;

import com.itis.app.filters.CustomFilter2;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {
    @Bean
    public FilterRegistrationBean<CustomFilter2> checkRole(){
        FilterRegistrationBean<CustomFilter2> checkRoleFilter = new FilterRegistrationBean<>();
        checkRoleFilter.setFilter(new CustomFilter2());
        checkRoleFilter.addUrlPatterns("/users");
        return checkRoleFilter;
    }
}
