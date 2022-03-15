package com.hamonize.admin.support;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
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

    @Autowired
    CommentsRespository cr;

    @RequestMapping("/list")
    public String supportList(@RequestParam(required = false, defaultValue = "0", value = "page") int page, Pageable pageable ,  HttpSession session, Support vo, Model model) {
        logger.info("\n\n\n <<< list >> page : {}", page);
        
        // paging
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC,"seq"));
        Page<Support> resultPage = sr.findAll(pageable);
        List<Support> list = resultPage.getContent();
        List<Support> slist = new ArrayList<>();

        for (Support support : list) {
            support.setStatus(support.getStatus().trim());
            support.setType(support.getType().trim());
            support.setViewDate(support.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
            slist.add(support);
            
        } 
        
        model.addAttribute("list", slist);
        model.addAttribute("nowPage", page);
        model.addAttribute("totalPage", resultPage.getTotalPages());

        return "/support/list";
	}


    @GetMapping("/edit")
    @ResponseBody
    public int supportEdit(Support svo, Comments vo, Model model) {
        logger.info("\n\n\n <<< 1:1문의 상세 수정 >> ");
        logger.info("seq >> {}", vo.getSeq());
        int ret = cr.update(vo);            
        return ret;
        // return "/support/apply";
	}

    @GetMapping("/view")
    public String supportView(Support vo, HttpSession session, Model model) {
        List <Comments> list = cr.findAllBySupportseq(vo.getSeq());

        for (Comments cm : list) {
            cm.setViewDate(cm.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm")));
        }

        logger.info("seq >> {}", vo.getSeq());
        Support edit = sr.findBySeq(vo.getSeq());

        edit.setViewDate(edit.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
        logger.info("list length : {}", list.size());
        model.addAttribute("edit", edit);
        model.addAttribute("clist", list);
        model.addAttribute("clistSize", list.size());

        return "/support/view";
	}

    @RequestMapping("/save")
    @ResponseBody
    public Long save(HttpSession session, Support pvo,Comments vo ) {
        logger.info("\n\n\n <<< support 코멘트 저장 >> ");
        Comments ret = new Comments();
        Long retval = (long) 0;
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
        logger.info("getSupportseq >> {}",vo.getSupportseq());
        pvo.setSeq(vo.getSupportseq());
        
        if(vo.getSeq() != null ){ // 코멘트 수정
            vo.setUpdtdate(LocalDateTime.now());
            int aa = cr.update(vo);
            retval = (long) aa;

            logger.info("update >>>{} ", retval);
            
        } else{ // 코멘트 저장
            logger.info("save >>> ");
            pvo.setStatus("D"); // 상태값 변경 처리중 -> 완료
            pvo.setUpdtdate(LocalDateTime.now()); // 상태값 변경 처리중 -> 완료
            sr.updateStatus(pvo);

            vo.setRgstrdate(LocalDateTime.now());
            ret = cr.save(vo);

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


    @RequestMapping("/deleteComment")
    public String deleteComment(HttpSession session, Comments vo, Support svo ) throws Exception{
        logger.info("comment seq : {}",vo.getSeq());
        Comments tmp = cr.findBySeq(vo.getSeq());
        Long sseq =tmp.getSupportseq();
        String returl = "redirect:/support/view?seq="+tmp.getSupportseq();
        
        logger.info("tmp >> s_seq : {}", tmp.getSupportseq());
        logger.info("\n\n\n <<< doamin 결제 페이지 >> ");
       
        cr.delete(vo);
        logger.info("cr.existsBySupportseq(sseq) : {}", cr.existsBySupportseq(sseq));
        if(!cr.existsBySupportseq(sseq) ){// 답변이 아예없음 > 처리중 상태로변경
            svo.setSeq(sseq);
            svo.setStatus("P");
            svo.setUpdtdate(LocalDateTime.now());
            
            sr.updateStatus(svo);
        }


        logger.info("returl : {}", returl);
        return returl;
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
