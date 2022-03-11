package com.hamonize.admin.mail;

import java.util.Properties;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;


public class MailSender extends JavaMailSenderImpl implements IMailSender {

    @Value("${spring.mail.host}")
    private String  host;

    @Value("${spring.mail.port}")
    private int  port;

    @Value("${spring.mail.username}")
    private String  username;

    @Value("${spring.mail.password}")
    private String  password;

    @Value("${spring.mail.properties.mail.smtp.auth}")
    private String  propertiesMailSmtpAuth;

    @Value("${spring.mail.properties.mail.transport.protocol}")
    private String  propertiesMailTransportProtocol;

    @Value("${spring.mail.properties.mail.starttls.enable}")
    private String  propertiesMailStarttlsEnable;

    @Value("${spring.mail.properties.mail.starttls.required}")
    private String  propertiesMailStarttlsRequired;

    private Properties properties = new Properties();

    @PostConstruct
    protected void postConstruct(){
        initJavaMailPropertis();
        setHost(host);
        setPort(port);
        setUsername(username);
        setPassword(password);
        setDefaultEncoding("utf-8");
        setJavaMailProperties(properties);
    }

    private void initJavaMailPropertis(){
        properties.put("mail.smtp.auth", propertiesMailSmtpAuth);
        properties.put("mail.transport.protocol", propertiesMailTransportProtocol);
        properties.put("mail.smtp.starttls.enable", propertiesMailStarttlsEnable);
        properties.put("mail.smtp.starttls.required", propertiesMailStarttlsRequired);
        
    }
}
