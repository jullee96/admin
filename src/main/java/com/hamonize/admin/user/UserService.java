package com.hamonize.admin.user;

import java.time.LocalDateTime;
import java.util.Random;

import com.hamonize.admin.util.SHA256Util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserRepository ur;

    public void update(User vo){
        String salt = SHA256Util.generateSalt();
        
        if(vo.getPasswd() == null || "".equals(vo.getPasswd())){
            User tmpUsr = ur.findByUserid(vo.getUserid()).get();
            vo.setPasswd(tmpUsr.getPasswd());
            vo.setSalt(tmpUsr.getSalt());
            
        } else{
            vo.setPasswd(SHA256Util.getEncrypt(vo.getPasswd(), salt));
            vo.setSalt(salt);
        }

        
        vo.setUpdtDate(LocalDateTime.now()); 
        ur.save(vo);


    }

    public String generateTmpPw() {
        Random rnd = new Random();
        StringBuffer buffer = new StringBuffer();
        

        for(int i=0;i<8;i++){
            int rand = rnd.nextInt(3);
            logger.info("ran >> {}",rand);

            if(rand == 0){
              buffer.append((char)((int)(rnd.nextInt(26))+97));
            }else if(rand == 1){
                buffer.append((rnd.nextInt(10)));
            } else {
                buffer.append((char)((int)(rnd.nextInt(26))+65));
            }
        }

        logger.info("generateTmpPw >> {}", buffer.toString());
        return buffer.toString();
    }
}
