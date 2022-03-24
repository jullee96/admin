package com.hamonize.admin;

import com.hamonize.admin.mail.IMailSender;
import com.hamonize.admin.mail.MailSender;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${attach.path}")
	private String path;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // logger.info("WebConfig path >>> ? file:{}",path);
	    registry.addResourceHandler("/img/**")
        .addResourceLocations("file:"+path+"/");
        
        // .addResourceLocations("file:/home/lee/uploads/img/");
    }

    @Bean
    public IMailSender mailsender(){
        return new MailSender();
    }
}
