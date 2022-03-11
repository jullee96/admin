package com.hamonize.admin.login;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.RedisConfig;
import com.hamonize.admin.mail.MailSendService;
import com.hamonize.admin.user.SecurityUser;
import com.hamonize.admin.user.User;
import com.hamonize.admin.user.UserRepository;
import com.hamonize.admin.user.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    public int a = 0;

    @Autowired
    HttpSession httpSession;
    
    @Autowired
    RedisConfig redis;
    
    @Autowired
    UserRepository ur;

    @Autowired
    MailSendService mss;
    
    @Autowired
    UserService us;

    @RequestMapping("")
    public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        SavedRequest save = (SavedRequest) request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        logger.info("session id: {}", session.getId());
        
        a += 1;
       
        return "/login/login";
	}

    @RequestMapping("/login")
    public String loginProc() {

        return "/main/main";
	}

    @RequestMapping("/logout")
    public String logoutProc(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    	request.getSession().invalidate();
		request.getSession(true);
        session.removeAttribute("userSession");
        session.removeAttribute("profileImg");

		return "redirect:/";
	}

    @RequestMapping("/kakao")
    public String kakaoLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        logger.info("<< kakao proc >> ");

		return "redirect:/";
	}
    

    @RequestMapping("/find")
    public String findView(User vo){
        logger.info("find user id/pw page");

        return "/login/findAccount"; 
    }


    @RequestMapping("/usernameEmailCheck")
    @ResponseBody
    public Boolean usernameEmailCheck(User vo){
        logger.info("\n\nusernameEmailCheck...............");
        Boolean ret = false;
        ret = ur.existsByUsernameAndEmail(vo.getUsername(), vo.getEmail());
        
        logger.info("\nret >>>>>> {}", ret);
        
        return ret; 
    }


    @RequestMapping("/useridEmailCheck")
    @ResponseBody
    public Boolean useridEmailCheck(User vo){
        logger.info("\n\nuseridEmailCheck...............");
        Boolean ret = false;
        ret = ur.existsByUseridAndEmail(vo.getUserid(), vo.getEmail());
        
        logger.info("\nret >>>>>> {}", ret);
        
        return ret; 
    }



  

    @RequestMapping("/findAccount")
    @ResponseBody
    public String findUserid(User vo){
        logger.info("find user id/pw page");
        String retval="";
        if( "".equals(vo.getUserid()) || vo.getUserid() != null){ // pw 찾기
            // 비밀번호 초기화 > 이메일 발송 
            // 아이디 정보 이메일 발송
            try {
                User findUser = ur.findByEmailAndUserid(vo.getEmail(), vo.getUserid());
                String tmpPw = us.generateTmpPw();
                findUser.setPasswd(tmpPw); 
                us.update(findUser);
                mss.sendPwRestMail(findUser.getEmail(), tmpPw);
                retval = "아이디를 가입하신 이메일 전송 완료했습니다. 이메일을 확인해주세요.";
            } catch (UnsupportedEncodingException e) {
                logger.error("pw 이메일 보내기 오류", e);
            }


        } else{ // id 찾기
            // 아이디 정보 이메일 발송
            try {
                User findUser = ur.findByEmailAndUsername(vo.getEmail(), vo.getUsername());
                mss.sendIDMail(findUser.getEmail(),findUser.getUserid());
                retval = "임시비밀번호를 가입하신 이메일 전송 완료했습니다. 이메일을 확인해주세요.";

            } catch (UnsupportedEncodingException e) {
                logger.error("id 메일 보내기 오류", e);
            }
        }

        return retval; 
    }
}
