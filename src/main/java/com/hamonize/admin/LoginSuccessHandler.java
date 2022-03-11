package com.hamonize.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.subscribe.SubscribeRepostory;
import com.hamonize.admin.user.SecurityUser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
  
    private RequestCache reqCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
    private RequestCache requestCache = new HttpSessionRequestCache();
		
    @Autowired
    SubscribeRepostory sr;

    @Autowired
    FileRepository fr;
  
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        logger.info("ddddd > {}",authentication.getPrincipal().getClass());

        SecurityUser user = (SecurityUser) authentication.getPrincipal();
        HttpSession httpSession = request.getSession(true);
        logger.info("onAuthenticationSuccess user domain : {}",user.getDomain());
        logger.info("onAuthenticationSuccess user username : {}",user.getUsername());
        
        httpSession.setAttribute("userSession", user);
        
        FileVO file = fr.findByUseridAndKeytype(user.getUserid(), "img");
        try {
            if( !"".equals(file.getFilepath().toString()) ){
                httpSession.setAttribute("profileImg", file.getFilepath());
            }
                
        } catch (NullPointerException e) {
            logger.error("profileimg 없음 ");
        }
        
        
        logger.info("session id: {}", httpSession.getId());
        logger.info("getUserid : {}", user.getUserid());
        
        
        
        if(user.getUserid() != null){
            response.sendRedirect("/main"); 
  
        } else{
            response.sendRedirect("/login");
        }

        clearAuthenticationAttributes(request);
        
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null) return;
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }


    
}
