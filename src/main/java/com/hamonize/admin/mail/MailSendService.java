package com.hamonize.admin.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
    @Autowired
    IMailSender mailSender;


    private Logger logger = LoggerFactory.getLogger(this.getClass());    
    private int size;
   
    //인증키 생성
    public String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;
        
        logger.info("size : {}",size);

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email, String authKey) throws UnsupportedEncodingException {
        
        logger.info("email : {}",email.trim());
        logger.info("authKey : {}",authKey.trim());
        
        logger.info("mailSender id : {}",mailSender.getUsername());
        logger.info("mailSender pw : {}",mailSender.getPassword());

        
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
                        .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                        .append("<a target='_blank' href='http://192.168.0.210:8080/signup/signUpConfirm?email=")
                        .append(email.trim())
                        .append("&authkey=")
                        .append(authKey.trim()+"'")
                        .append(">이메일 인증 확인</a>")
                        .toString());
            
            sendMail.setFrom(mailSender.getUsername(), "하모나이즈 관리자");
            sendMail.setTo(email);
            sendMail.send();
            
        } catch (MessagingException e) {
            logger.error("이메일 발송 오류 {}", e);

        }


        return authKey;
    } 
 
    public String sendPwRestMail(String email, String passwd) throws UnsupportedEncodingException {
        
        logger.info("email : {}",email.trim());
        logger.info("passwd : {}",passwd.trim());
        
        logger.info("mailSender id : {}",mailSender.getUsername());
        logger.info("mailSender pw : {}",mailSender.getPassword());

        
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("임시 비밀번호 발급 이메일");
            sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호 발급]</h1>")
                        .append("<p>아래의 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.</p>")
                        .append(passwd.trim())
                        .toString());
            
            sendMail.setFrom(mailSender.getUsername(), "하모나이즈 관리자");
            sendMail.setTo(email);
            sendMail.send();
            
        } catch (MessagingException e) {
            logger.error("이메일 발송 오류 {}", e);

        }


        return passwd;
    } 


    public String sendIDMail(String email, String userid) throws UnsupportedEncodingException {
        
        logger.info("email : {}",email.trim());
        logger.info("userid : {}",userid.trim());
        
        logger.info("mailSender id : {}",mailSender.getUsername());
        logger.info("mailSender pw : {}",mailSender.getPassword());

        
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("아이디 찾기 이메일");
            sendMail.setText(new StringBuffer().append("<h1>[아이디 찾기]</h1>")
                        .append("<p>아이디 정보입니다</p>")
                        .append(userid.trim())
                        .toString());
            
            sendMail.setFrom(mailSender.getUsername(), "하모나이즈 관리자");
            sendMail.setTo(email);
            sendMail.send();
            
        } catch (MessagingException e) {
            logger.error("이메일 발송 오류 {}", e);

        }


        return userid;
    } 
 
}
