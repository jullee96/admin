package com.hamonize.admin;

import com.hamonize.admin.social.CustomOAuth2UserService;
// import com.hamonize.admin.social.CustomOAuth2UserService;
import com.hamonize.admin.user.SecurityUserDetailsService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("${attach.path}")
    private String path;
    
    @Autowired
    LoginSuccessHandler authSuccessHandler;

    @Autowired
    Oauth2LoginSuccessHandler oauth2LoginSuccessHandler;

    @Autowired
    LoginFailureHandler authFailureHandler;

    @Autowired
    SecurityUserDetailsService userDetailService;
    
    @Autowired
    CustomOAuth2UserService customOAuth2UserService;

    @Autowired
    private CustomAuthenticationProvider authProvider;

    
    @Override
    public void configure(WebSecurity web) throws Exception {

        web.ignoring()
            .antMatchers("/resources/**")
            .antMatchers("/css/**")
            .antMatchers("/js/**")
            .antMatchers("/img/**")
            .antMatchers("/images/**")
            .antMatchers("/vendors/**")
            .antMatchers("/signup/**")
            .antMatchers("/argon/**");

            
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable()
            .authorizeRequests()
            .antMatchers("/api/**", "/signup/**", "/login/**","/","/prodcut/**").permitAll()
            .anyRequest().authenticated();
        
        http.formLogin()
            .loginPage("/login")
            .usernameParameter("userid")
            .passwordParameter("passwd")
            .loginProcessingUrl("/login/login")
            
            .successHandler(authSuccessHandler)
            .failureHandler(authFailureHandler);
        
        http.logout()
            .logoutRequestMatcher(new AntPathRequestMatcher("/login/logout")).logoutSuccessUrl("/")
            .invalidateHttpSession(true);
        }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }

    

}
