package com.hamonize.admin.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.company.Company;
import com.hamonize.admin.company.CompanyRepository;
import com.hamonize.admin.company.CompanyService;
import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.util.SHA256Util;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    FileRepository fr;

    @Autowired
    UserService us;

    @Autowired
    UserRepository ur;

    @Autowired
    CompanyService cs;

    @Autowired
    CompanyRepository cr;

    @RequestMapping("/list")
    public String userlist(@RequestParam(required = false, defaultValue = "0", value = "page") int page, Pageable pageable, HttpSession session, Model model) {
        logger.info("\n\n\n <<< list >> page : {}", page);
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        
                
        // paging
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC,"seq"));
        Page<User> resultPage = ur.findByRoleNot(pageable,"USER_ADMIN");
        logger.info("resultPage getTotalPages >>>> {}", resultPage.getTotalPages());
        logger.info("resultPage nextPageable >>>> {}", resultPage.nextPageable());

        List<User> list = resultPage.getContent();
        List<User> ulist = new ArrayList<>();

        for (User el : list) {
            el.setViewDate(el.getRgstrDate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
            ulist.add(el);
            
        } 
        model.addAttribute("list", ulist);
        model.addAttribute("nowPage", page);
        model.addAttribute("totalPage", resultPage.getTotalPages());

        
        model.addAttribute("list", list);

        return "/user/list";
	}


    @RequestMapping("/detail")
    public String signup(HttpSession session, User vo, Model model) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
       logger.info("user id >>> {}",user.getUserid());
       Company newComVo = cr.findByUserid(user.getUserid());
       model.addAttribute("companyInfo", newComVo);

       FileVO file = fr.findByUseridAndKeytype(user.getUserid(), "img");
        try {
            if( !"".equals(file.getFilepath().toString()) ){
                session.setAttribute("profileImg", file.getFilepath());
            }
                
        } catch (NullPointerException e) {
            logger.error("profileimg 없음 ");
        }

        return "/user/detail";
	}

    @RequestMapping("/update")
    public String save(HttpSession session, HttpServletResponse response, User vo, Company cvo, Model model ) throws IOException {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        vo.setUserid(user.getUserid());
        vo.setDomain(user.getDomain());
        cvo.setUserid(user.getUserid());
        
        // 수정실패시 출력 메세지
        response.setContentType("text/html; charset=UTF-8");
        // String message = getExceptionMessage(exception);
            
        PrintWriter out = response.getWriter();

    
        if(!"".equals(vo.getBefore_passwd()) && vo.getBefore_passwd() != null){
            us.update(vo);
            cs.update(cvo);


            // update session user
            User newVo = ur.findByUserid(vo.getUserid()).get();
            
            SecurityUser updateUser = new SecurityUser(newVo);
            session.removeAttribute("userSession");
            session.setAttribute("userSession", updateUser);

        }else{ 
            // out.println("<script>alert(''); location.href='/login';</script>");
            // out.flush();
            logger.info("변경사항 없음");
        }

        return "redirect:/user/detail";
	}


    @RequestMapping("/images")
    public void imgView(HttpSession session, HttpServletResponse response, Model model)  throws IOException {
        logger.info("<<<<<<<<<<<< imgView images >>>>>>>>>");
        
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        FileVO file = fr.findByUseridAndKeytype(user.getUserid(), "img");
         
        try {
           
            logger.info("file path : {}", file.getFilepath());
            StringBuilder sb =new StringBuilder();
            
            if(file.getFilepath().contains("://")){
                sb = new StringBuilder(file.getFilepath());
                logger.info("......;;; : {}", sb.toString());
            
            } else{
                sb = new StringBuilder("file:"+ file.getFilepath());
            }

            URL fileUrl = new URL(sb.toString());
            IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
            
            
        } catch (NullPointerException e) {
            
            logger.error("NullPointerException", e);
        }
     
	}

    @RequestMapping("/passwdChk")
    @ResponseBody
    public Boolean passwdChk(@RequestParam("before_passwd") String before_passwd , HttpSession session, Model model)  throws IOException {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
       
        logger.info("get before_passwd {}",before_passwd);
        
        logger.info("session {}", user.getPasswd());
        logger.info("encode >>> {}", SHA256Util.getEncrypt(before_passwd, user.getSalt()));

        if(user.getPasswd().equals(SHA256Util.getEncrypt(before_passwd, user.getSalt()))){
            return true;
        }else{
            return false;
        }
 
        
	}


}
