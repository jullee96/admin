package com.hamonize.admin.signup;

import java.util.List;
import java.util.Map;

import com.hamonize.admin.mail.MailSendService;
import com.hamonize.admin.user.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/signup")
public class SignupController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    SignupRepository sr;  

    @Autowired
    SignupService ss;

    @Autowired
    MailSendService mss;

    @RequestMapping("")
    public String signup() {
        logger.info("<< signup page >>");

        return "/signup/signup";
	}


    /**
     * 회원가입 정보 저장 func
     * @param User vo
     * 
     * @return
     */

    @RequestMapping("/signup")
    public String save(User vo) {
        try {
            // genterate authKey && sent to auhorize email
            vo.setAuthkey(mss.getKey(6));
            
            logger.info("vo.getAuthkey() > {}", vo.getAuthkey());
            mss.sendAuthMail(vo.getEmail(),vo.getAuthkey());
            ss.save(vo);
           
        } catch (Exception e) {
            logger.error("회원가입 오류 : {}",e.getMessage());    
        }
        
        return "redirect:/login";
	}

    /**
     * 아이디 중복 확인 func
     * @param User vo
     * 
     * @return 중복여부 true or false
     */
    @PostMapping("/idDupCheck")
    @ResponseBody
    public boolean idDupCheck(User vo, Model model){
        List<User> chk = sr.findByUserid(vo.getUserid());
        
        boolean ret = false;
        if (chk.size() == 0 ){
            ret = true;
        }else{
            ret = false;
        }

        return ret;
    }


    /**
     * 아이디 중복 확인 func
     * @param User vo
     * 
     * @return 중복여부 true or false
     */
    @PostMapping("/emailDupCheck")
    @ResponseBody
    public boolean emailDupCheck(User vo, Model model){
        List<User> chk = sr.findByEmail(vo.getEmail());
        
        boolean ret = false;
        if (chk.size() == 0 ){
            ret = true;
        }else{
            ret = false;
        }

        return ret;
    }

    
    //account_verifications
    @RequestMapping("/signUpConfirm")
    public String signUpConfirm(@RequestParam Map<String, String> map, User vo, Model model) {
        try {
            logger.info("map >> {}", map.get("email"));
            logger.info("authkey >> {}", map.get("authkey"));

            // update email authKey && role
            vo.setEmail(map.get("email").trim());
            vo.setAuthkey(map.get("authkey").trim());    
            vo.setRole("ROLE_ADMIN");
            int ret = sr.updateAuthkey(map.get("email").trim(),"A",vo.getRole());
            logger.info("ret {}", ret);
        } catch (Exception e) {
            logger.error("회원가입 오류 : {}",e.getMessage());    
        }
        
        return "redirect:/login";
	}


    
}
