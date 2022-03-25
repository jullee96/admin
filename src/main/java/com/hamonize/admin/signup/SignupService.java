package com.hamonize.admin.signup;

import java.time.LocalDateTime;

import javax.transaction.Transactional;

import com.hamonize.admin.user.User;
import com.hamonize.admin.util.SHA256Util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class SignupService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
	private SignupRepository sr;
    
    public User save(User vo) {	
        String salt = SHA256Util.generateSalt();
		
        vo.setPasswd(SHA256Util.getEncrypt(vo.getPasswd(), salt));
        vo.setSalt(salt);
        vo.setRole("ROLE_GUEST");
        vo.setRgstrdate(LocalDateTime.now());
        
        return sr.save(vo);
	}

    
    
}
