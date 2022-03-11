package com.hamonize.admin.support;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.user.SecurityUser;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/support")
public class SupportController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    FileRepository fr;

    @Autowired
    SupportRepository sr;

    @RequestMapping("/list")
    public String supportList(@RequestParam(required = false, defaultValue = "0", value = "page") int page, Pageable pageable ,  HttpSession session, Support vo, Model model) {
        logger.info("\n\n\n <<< list >> page : {}", page);
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");

        
        // paging
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC,"seq"));
        Page<Support> resultPage = sr.findAllByUserid(pageable, user.getUserid());
        logger.info("resultPage getTotalPages >>>> {}", resultPage.getTotalPages());
        logger.info("resultPage nextPageable >>>> {}", resultPage.nextPageable());

        List<Support> list = resultPage.getContent();
        List<Support> slist = new ArrayList<>();

        for (Support support : list) {
            support.setStatus(support.getStatus().trim());
            support.setType(support.getType().trim());
            support.setViewDate(support.getInsdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
            slist.add(support);
            
        } 
        model.addAttribute("list", slist);
        model.addAttribute("nowPage", page);
        model.addAttribute("totalPage", resultPage.getTotalPages());

        return "/support/list";
	}

    @GetMapping("/apply")
    public String supportCreate(Support vo, HttpSession session, Model model) {
        
        logger.info("\n\n\n <<< 1:1문의 작성 >> ");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
      
        return "/support/apply";
	}

    @GetMapping("/edit")
    public String supportEdit(Support vo, HttpSession session, Model model) {
        logger.info("seq : ",vo.getSeq());

        logger.info("\n\n\n <<< 1:1문의 상세 수정 >> ");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        logger.info("seq >> {}", vo.getSeq());
        Support edit = sr.findBySeq(vo.getSeq());
            
        model.addAttribute("edit", edit);
    
        return "/support/apply";
	}

    @GetMapping("/view")
    public String supportView(Support vo, HttpSession session, Model model) {
        logger.info("seq : ",vo.getSeq());

        logger.info("\n\n\n <<< 1:1문의 상세 보기>> ");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
            logger.info("seq >> {}", vo.getSeq());
            Support edit = sr.findBySeq(vo.getSeq());
                
            model.addAttribute("edit", edit);
    
        return "/support/view";
	}

    @RequestMapping("/save")
    @ResponseBody
    public Long save(HttpSession session, Support vo ) {
        logger.info("\n\n\n <<< support 저장 >> ");
        Support ret = new Support();
        Long retval = (long) 0;
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
        logger.info("getSeq >> {}",vo.getSeq());
        
        if(vo.getSeq() != null ){
            vo.setUpdtdate(LocalDateTime.now());
            int aa = sr.update(vo);
            retval = (long) aa;

            logger.info("update >>>{} ", retval);
            
        } else{
            logger.info("save >>> ");
            vo.setStatus("P");
            vo.setInsdate(LocalDateTime.now());
            ret = sr.save(vo);
            retval = ret.getSeq();
        }
        
      
        return retval;
    }

    @RequestMapping("/delete")
    public String delete(HttpSession session, Support vo) throws Exception{
        logger.info("seq : ",vo.getSeq());

        logger.info("\n\n\n <<< doamin 결제 페이지 >> ");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        sr.delete(vo);

        return "redirect:/support/list";
	}

    @RequestMapping("/getImageUrl")
    public void imgView(@RequestParam("seq") Integer seq, HttpSession session, HttpServletResponse response, Model model)  throws IOException {
        
       SecurityUser user = (SecurityUser) session.getAttribute("userSession");
       logger.info("file path : {}", seq);

       FileVO file = fr.findByUseridAndSeq(user.getUserid(), seq );
        
        logger.info("file path : {}", file.getFilepath());
        
        StringBuilder sb = new StringBuilder("file:"+ file.getFilepath());
        URL fileUrl = new URL(sb.toString());
        logger.info("fileUrl >> {}",fileUrl);

        IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
	}

}
