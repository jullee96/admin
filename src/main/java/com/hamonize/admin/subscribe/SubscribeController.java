package com.hamonize.admin.subscribe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import com.hamonize.admin.user.SecurityUser;
import com.hamonize.admin.user.User;
import com.hamonize.admin.user.UserRepository;


@Controller
@RequestMapping("/subscribe")
public class SubscribeController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    SubscribeService ss;
    
    @Autowired
    SubscribeRepostory sr;

    @Autowired
    UserRepository ur;

    @RequestMapping("/payment")
    public String paymentView(HttpSession session, Subscribe vo, Model model) {
        // 결제 정보는 있나 도메인정보가 없다면 도메인 생성페이지로
        // 결제 정보랑 도메인 정보 둘다 있다면 메인의 뉴저 메뉴 활성화 > 마이페이지로

        logger.info("\n\n\n <<< doamin 결제 페이지 >> ");
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");

        logger.info("getUserid >> {}",user.getUserid());
        logger.info("getDomain >> {}",user.getDomain());
        
        int payAt = ss.findSubscribeInfo(user.getUserid());
        
        logger.info("payAt >> {}", payAt);
        model.addAttribute("payAt", payAt);

        if(payAt > 0){
            logger.info("payAt >>>>>>>>> ", payAt);
            model.addAttribute("payAt", payAt);
            model.addAttribute("domainAt", user.getDomain());
            
            return "/subscribe/subscribe";

        } else if( vo.getItemno() == null || "".equals(vo.getItemno()) ){
            return "redirect:/"; 
            
        }else if( user.getDomain() != null ){ // 도메인이 이미 있으면 마이페이지로
            return "redirect:/user/detail"; 

        } else{
            session.setAttribute("itemno", vo.getItemno());

            return "/subscribe/subscribe";
        }


	}

    /**
     * 결제 정보 추가 func
     * 
     * 결제할 아이템과 결제할 카드정보등 저장 -> tbl_subscribe_info
     * @param session > userid
     * @param Subscribe > vo
     * @return
     */
    @PostMapping("/savePayment")
    @ResponseBody
    public String paymentSave(HttpSession session, Subscribe vo) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        String userid = user.getUserid();
        logger.info("getName :: {}", vo.getName());
        logger.info("getCardnum :: {}", vo.getCardnum());

        try {
            vo.setUserid(userid);
            ss.save(vo);
            return "S";       
        } catch (Exception e) {
            return "E";       
        }
     
	}

    @GetMapping("/domain")
    public String domainView(HttpSession session, Subscribe vo) {       
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        String userid = user.getUserid();
        String itemno = (String) session.getAttribute("itemno");
    
        User uvo = ur.findByUserid(userid).get();

        logger.info("\n\n\n <<< doamin 생성 페이지 >> ");
        logger.info("\n\n\nuserid >> {}",userid);
        logger.info("domain >> {}", uvo.getDomain());
        logger.info("itemno >> {}",itemno);
        
        vo.setUserid(userid);
       
        // 결제 정보 && 생성된 도메인이 있는지 확인 
        int isExistSub = ss.findSubscribeInfo(vo.getUserid());
        logger.info("isExistSub >> {}\n\n\n\n",isExistSub);

        if(isExistSub > 0){ // 결제 함
            if( "".equals(uvo.getDomain()) || uvo.getDomain() == null){ //도메인 생성 안한 경우 
                return "/subscribe/domain";
            }else{ // 이미 도메인 생성한 경우
                return "redirect:/";
            }

        }else{ //결제 안함
            return "redirect:/subscribe/payment?itemno="+itemno; 
        }

	}

    /**
     * 도메인 정보 추가 func
     * 
     * 결제 정보가 있는 경우만 도메인 생성가능
     * @param session
     * @param vo
     * @return
     */
    @PostMapping("/saveDomain")
    @ResponseBody
    public String domianSave(HttpSession session, Subscribe vo) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
       
        logger.info("<<< 도메인 정보 >>> ");
        logger.info("도메인 이름 : {}", vo.getDomain());
        logger.info("유저 아이디 : {}", vo.getUserid());
       
        try {
            ur.updateDomain(vo.getDomain(), vo.getUserid());
            user.setDomain(vo.getDomain());
            session.setAttribute("userSession", user);
            return "S";

        } catch (Exception e) {
            logger.error("eeee ");
            return "F";
        }
   
        

	}


    /**
     * 도메인 정보 추가 func
     * 
     * 결제 정보가 있는 경우만 도메인 생성가능
     * @param session
     * @param vo
     * @return
     */
    @GetMapping("/bills")
    // @ResponseBody
    public String getbillingInfo(HttpSession session, Subscribe vo, Model model) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        List<Subscribe> list = sr.findAllByUserid(user.getUserid());        
        for (Subscribe subscribe : list) {
            logger.info("subscrib : {}", subscribe.getCardnum());
        }        
        
        model.addAttribute("pList", list);
        
        return "/subscribe/info";
      
	}

    /**
     * 도메인 정보 추가 func
     * 
     * 결제 정보가 있는 경우만 도메인 생성가능
     * @param session
     * @param vo
     * @return
     */
    @GetMapping("/invoices")
    public String getList(HttpSession session, Subscribe vo) {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");

        return "/subscribe/invoice";
      
	}
}
