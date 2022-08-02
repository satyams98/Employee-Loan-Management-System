package com.MvcPractise.configuration;

import org.springframework.context.annotation.*;
//import org.springframework.security.config.annotation.authentication.builders.*;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@EnableWebSecurity
@ComponentScan("com.MvcPractise")
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(User.withDefaultPasswordEncoder()
                .username("satyams98").password("pass").roles("ADMIN").build());
        return manager;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http    .csrf().disable()
                .authorizeRequests()
                .anyRequest().hasRole("ADMIN")
                .and().formLogin().and()
                .httpBasic()
                .and()
                .logout()

                .logoutSuccessUrl("/")
        ;
    }
}