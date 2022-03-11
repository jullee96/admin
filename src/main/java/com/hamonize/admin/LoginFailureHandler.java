package com.hamonize.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
                
            exception.printStackTrace();
            String message = getExceptionMessage(exception);
            logger.info("login fail... : {}",request.getParameter("userid"));
            logger.info("msg : {}",message);
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+message+"'); location.href='/login';</script>");
            out.flush();

    }


    private String getExceptionMessage(AuthenticationException exception) {
        if (exception instanceof BadCredentialsException) {
            return "비밀번호를 확인해주세요";
        } else if (exception instanceof UsernameNotFoundException) {
            return "존재하지 않는 계정입니다";
        } else if (exception instanceof AccountExpiredException) {
            return "계정만료";
        } else if (exception instanceof CredentialsExpiredException) {
            return "비밀번호만료";
        } else if (exception instanceof DisabledException) {
            return "이메일 인증이 완료되지 않은 계정입니다";
        } else if (exception instanceof LockedException) {
            return "관리자 계정만 로그인 가능합니다";
        } else {
            return "아이디 또는 비밀번호를 확인해주세요";
        }
    }
    
}
