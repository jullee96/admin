package com.hamonize.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.web.bind.annotation.RestController;

@EnableScheduling
@EnableRedisHttpSession
@RestController
@SpringBootApplication
public class AdminApplication {
    @Autowired
    HttpSession httpSession;

	public static void main(String[] args) {
		SpringApplication.run(AdminApplication.class, args);
	}
}
