package com.kh.DOT.security.securityConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.kh.DOT.security.model.service.SecurityService;

// 수정해야됨 주소
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecuirtyConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	SecurityService service;
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Bean
    public static NoOpPasswordEncoder noPasswordEncoder() {
      return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
    }  
	  

	@Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(service).passwordEncoder(passwordEncoder()); 
    }
	
	 @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**", "/index.html");
    }
	 
	 @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/member.html*").authenticated()
                .antMatchers("/super.html*").hasAuthority("super")
                .antMatchers("/normal.html*").hasAnyAuthority("super","normal")
                .antMatchers("/**").permitAll();
        
        http.formLogin()
                .loginProcessingUrl("/login")        
                .loginPage("/index.html")
                .defaultSuccessUrl("/member.html").failureUrl("/deny.html")
                .permitAll().and().csrf().disable();
        
        http.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/index.html")
                .invalidateHttpSession(true);

        http.exceptionHandling()
                .accessDeniedPage("/deny.html");
    }

}
