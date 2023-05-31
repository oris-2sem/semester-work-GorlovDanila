package ru.itis.security.config;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@AllArgsConstructor
@EnableWebSecurity
public class SecurityConfig {

    private PasswordEncoder passwordEncoder;
    private UserDetailsService userDetailsService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        AuthenticationManagerBuilder authenticationManagerBuilder = http.getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.userDetailsService(userDetailsService);
        AuthenticationManager authenticationManager = authenticationManagerBuilder.build();

        http.authorizeRequests()
                .antMatchers("/admin*/**").hasAuthority("ADMIN")
                .antMatchers("/title/*").authenticated()
                .antMatchers("/main", "/login", "/registration", "/genres", "/authors").permitAll()
                .and()
                .authenticationManager(authenticationManager)
                .formLogin()
                .loginPage("/authorization")
                .usernameParameter("personLogin")
                .passwordParameter("personPassword")
                .defaultSuccessUrl("/")
                .failureUrl("/registration")
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .logoutSuccessUrl("/")
                .and()
                .csrf().ignoringAntMatchers("/authors/*");

        return http.build();
    }

    @Autowired
    public void bindUserDetailsServiceAndPasswordEncoder(AuthenticationManagerBuilder builder) throws Exception {
        builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }
}
