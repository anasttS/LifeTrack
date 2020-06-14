package com.itis.app.config;

import com.itis.app.filters.AgentFilter;
import com.itis.app.filters.CustomRoleFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FilterConfig {
    @Bean
    public FilterRegistrationBean<CustomRoleFilter> checkRole(){
        FilterRegistrationBean<CustomRoleFilter> checkRoleFilter = new FilterRegistrationBean<>();
        checkRoleFilter.setFilter(new CustomRoleFilter());
        checkRoleFilter.addUrlPatterns("/users");
        return checkRoleFilter;
    }

    @Bean
    public FilterRegistrationBean<AgentFilter> checkAgent(){
        FilterRegistrationBean<AgentFilter> checkAgentFilter = new FilterRegistrationBean<>();
        checkAgentFilter.setFilter(new AgentFilter());
        return checkAgentFilter;
    }
}
