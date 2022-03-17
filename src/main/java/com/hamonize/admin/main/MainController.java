package com.hamonize.admin.main;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.hamonize.admin.support.Support;
import com.hamonize.admin.support.SupportRepository;
import com.hamonize.admin.user.SecurityUser;
import com.hamonize.admin.user.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MainController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    SupportRepository sr;

    @Autowired
    UserRepository ur;

    @RequestMapping("/")
    public String home() {
        return "/login/login";
	}

    @RequestMapping("/main")
    public String main(HttpSession session, Pageable pageable , Support vo, Model model) {
        // paging
        pageable = PageRequest.of(0, 5, Sort.by(Sort.Direction.DESC,"seq"));
        Page<Support> resultPage = sr.findByStatus(pageable, "P");
        List<Support> list = resultPage.getContent();
        List<Support> slist = new ArrayList<>();
        Long totalSupportCnt = sr.count();
        int totalSupportProcessingCnt = list.size();

        for (Support support : list) {
            support.setStatus(support.getStatus().trim());
            support.setType(support.getType().trim());
            support.setViewDate(support.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm")));
            slist.add(support);
            
        } 
        
        Long totalUserCnt = ur.countByRoleNot("ROLE_ADMIN");
        Long totalDomainCnt = ur.countByDomainNotNull();

        logger.info("totalSupportProcessingCnt >> {}",totalSupportProcessingCnt);
        logger.info("totalSupportCnt >> {}",totalSupportCnt);

        model.addAttribute("list", slist);
        model.addAttribute("totalDomainCnt", totalDomainCnt);
        model.addAttribute("totalSupportProcessingCnt", totalSupportProcessingCnt);
        model.addAttribute("totalSupportCnt", totalSupportCnt);

        model.addAttribute("totalUserCnt", totalUserCnt);

        return "/main/main";
    }
}
