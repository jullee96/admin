package com.hamonize.admin.main;

import javax.servlet.http.HttpSession;
import com.hamonize.admin.user.SecurityUser;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MainController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/")
    public String home() {
        return "/login/login";
	}

    @RequestMapping("/main")
    public String main(HttpSession session) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        logger.info("\n\n userid >> {}\n\n", user.getUserid());
        return "/user/detail";
    }
}
