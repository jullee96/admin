package com.hamonize.admin.util;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.Base64.Encoder;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.user.SecurityUser;
import com.nimbusds.jose.proc.SecurityContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class SHA256Util implements PasswordEncoder{
// public class SHA256Util {

    private static Logger logger = LoggerFactory.getLogger(SHA256Util.class);
    private static final String ALGORITHM = "HmacSHA256";
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    

    public static String salt = "";

    public SHA256Util(String salt) {
        logger.info("111 salt : {}", salt);

        this.salt = salt;
    }


    public static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[8];
        random.nextBytes(salt);

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < salt.length; i++) {
            sb.append(String.format("%02x", salt[i]));
        }

        return sb.toString();
    }


    public static String getEncrypt(String message, String salt) {
        logger.info("message >> {}",message);
        logger.info("salt >> {}", salt);
        String result = "";

        try {
            Mac sha256_HMAC = Mac.getInstance(ALGORITHM);
            SecretKeySpec secret_key = new SecretKeySpec(salt.getBytes(), ALGORITHM);

            sha256_HMAC.init(secret_key);

            byte[] bt = sha256_HMAC.doFinal(message.getBytes());

            Encoder encoder = Base64.getEncoder();

            String hash = encoder.encodeToString(bt);
            result = hash;

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return result;
    }

    @Override
    public String encode(CharSequence rawPassword) {
        logger.info("rawPassword : {}", rawPassword);
        logger.info("salt : {}", salt);
       
        return getEncrypt(rawPassword.toString(), salt);
    }


    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {

        logger.info("<< matches >> ");
        logger.info("rawPassword >> {} \n\n",rawPassword);
        logger.info("encodedPassword >> {} \n\n",encodedPassword);
        
        String aaa = encode(rawPassword);
        
        if(aaa.equals(encodedPassword)){
            logger.info("pw 같음");
            return true;
        } else{
            logger.info("pw 틀림");

            return false;
        }
    }

}

