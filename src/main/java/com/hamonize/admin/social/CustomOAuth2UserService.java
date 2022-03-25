package com.hamonize.admin.social;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.hamonize.admin.LoginFailureHandler;
import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.user.User;
import com.hamonize.admin.user.UserRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User>{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserRepository ur;

    @Autowired
    FileRepository fr;

    @Autowired
    LoginFailureHandler authFailureHandler;
    
    private final HttpSession session;
    
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        logger.info("\n\n\n\n<<<<<<<<< CustomOAuth2UserService >>>>>>>> \n\n");

        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        logger.info("registrationId >>>>> {}", registrationId);

        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());


        logger.info(" find email... {}", attributes.getEmail());
        logger.info(" find name... {}", attributes.getName());
        logger.info(" find picture... {}", attributes.getPicture());
        
        User user = saveOrUpdate(registrationId, attributes);

        if("kakao".equals(registrationId)){
            Map<String, Object> tmp = new HashMap<>();
    
            tmp.put("id", attributes.getEmail());
            tmp.put("email", attributes.getEmail());
            tmp.put("name", attributes.getName());
            tmp.put("picture", attributes.getPicture());
            
            attributes.setAttributes(tmp);    
        }
    
        

        return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority(user.getRole())),
            attributes.getAttributes(),
            attributes.getNameAttributeKey());

    }

    // 유저 생성 및 수정 서비스 로직
    private User saveOrUpdate(String registrationId, OAuthAttributes attributes){
        Boolean isExist = false;
        isExist = ur.existsByEmail(attributes.getEmail().toString());
        User user = new User();
        FileVO fvo = new FileVO();
           

        if(isExist){ //이미 등록된 이메일 update
            user = ur.findByEmail(attributes.getEmail()).get();
            
            if(!user.getPicture().equals(attributes.getPicture())){
                user.setPicture(attributes.getPicture());
                fvo.setFilepath(attributes.getPicture());
                fvo.setUserid(user.getUserid());
                fr.updateSnsImg(fvo);
            } 

            if(!user.getUsername().equals(attributes.getName())){
                user.setUsername(attributes.getName());
            } 
            
            logger.info("user id : {}", user.getUserid());
            logger.info("user name : {}", attributes.getName());
            logger.info("user picture : {}", attributes.getPicture());


            if(!user.getUserid().equals(user.getUserid())){ 
                logger.info("이미 있는 이메일을 사용중인 계정 ");
                throw new LockedException(attributes.getEmail().toString()); 
            }
        }else{ // new >  save sns user
            logger.info("\n\n properties : {}",attributes.getAttributes().get("properties"));
            
            user.setUserid(attributes.getEmail());
            user.setUsername(attributes.getName());
            user.setEmail(attributes.getEmail());
            user.setPicture(attributes.getPicture());
            user.setRole("ROLE_ADMIN");
            user.setRgstrdate(LocalDateTime.now());
            user.setPasswd("");

            if(registrationId.equals("google")){

                if(!"".equals(attributes.getPicture())){
                    fvo.setFilepath(attributes.getPicture());
                    fvo.setKeytype("img"); 
                    fvo.setUserid(attributes.getEmail());
                    fvo.setFilename("google_profileImg");
                    fvo.setFilerealname("google_profileImg");

                    fr.save(fvo);
                }
                
            }else if(registrationId.equals("naver")){ // update naver
    
                if(!"".equals(attributes.getPicture())){
                    fvo.setFilepath(attributes.getPicture());
                    fvo.setKeytype("img"); 
                    fvo.setUserid(attributes.getEmail());
                    fvo.setFilename("naver_profileImg");
                    fvo.setFilerealname("naver_profileImg");
                    fr.save(fvo);
                }
            
            }else if(registrationId.equals("kakao")){ // update google


                if(!"".equals(attributes.getPicture())){
                    fvo.setFilepath(attributes.getPicture());
                    fvo.setKeytype("img"); 
                    fvo.setUserid(attributes.getEmail());
                    fvo.setFilename("kakao_profileImg");
                    fvo.setFilerealname("kakao_profileImg");

                    fr.save(fvo);
                }
            
            } else{
                logger.info("errorrrr");
            }
        }


        return ur.save(user);
    }
}
