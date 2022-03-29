package com.hamonize.admin.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.company.Company;
import com.hamonize.admin.company.CompanyRepository;
import com.hamonize.admin.company.CompanyService;
import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.org.Org;
import com.hamonize.admin.org.OrgRepository;
import com.hamonize.admin.pcmangr.Pcmangr;
import com.hamonize.admin.pcmangr.PcmangrRepository;
import com.hamonize.admin.util.SHA256Util;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
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

    @Autowired
    PcmangrRepository pcr;

    @Autowired
    OrgRepository or;

    @RequestMapping("/list")
    public String userlist(@RequestParam(required = false, defaultValue = "0", value = "page") int page, Pageable pageable, HttpSession session, Model model) {
        // paging
        pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC,"seq"));
        Page<User> resultPage = ur.findByRoleNot(pageable,"ROLE_ADMIN");
        List<User> list = resultPage.getContent();
        List<User> ulist = new ArrayList<>();

        for (User el : list) {
            el.setViewdate(el.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
            el.setStatus(el.getStatus().trim());
            ulist.add(el);
            
        } 
        model.addAttribute("list", ulist);
        model.addAttribute("nowPage", page);
        model.addAttribute("totalPage", resultPage.getTotalPages());

        
        model.addAttribute("list", list);

        return "/user/list";
	}


    @RequestMapping("/detail")
    public String signup(HttpSession session, HttpServletRequest request, User vo, Model model) {
       vo = ur.findByUserid(vo.getUserid()).get();

       Company newComVo = cr.findByUserid(vo.getUserid());
       List<Pcmangr> pcList = pcr.findByDomain(vo.getDomain());

       model.addAttribute("user", vo);
       model.addAttribute("companyInfo", newComVo);
       model.addAttribute("totalPcCnt", pcList.size());

       model.addAttribute("pcList", pcList);
       
       FileVO file = fr.findBySeqAndKeytype(vo.getSeq(), "img");

       try {
            if( !"".equals(file.getFilepath().toString()) ){
                session.setAttribute("profileImg", file.getFilepath());
            }
                
        } catch (NullPointerException e) {
           
            if(!"".equals(vo.getPicture())){
                session.setAttribute("profileImg", vo.getPicture());

            }else{
                session.setAttribute("profileImg", null);
            }
            
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
            logger.info("변경사항 없음");
        }

        return "redirect:/user/detail";
	}


    @RequestMapping("/images")
    public void imgView(@RequestParam("userid") String userid, HttpSession session, HttpServletResponse response, Model model)  throws IOException {
        FileVO file = fr.findByUseridAndKeytype(userid, "img");
         
        try {
            StringBuilder sb = new StringBuilder();
            
            if(file.getFilepath().contains("://")){
                sb = new StringBuilder(file.getFilepath());
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
       
        if(user.getPasswd().equals(SHA256Util.getEncrypt(before_passwd, user.getSalt()))){
            return true;
        }else{
            return false;
        }
 	}


    @RequestMapping("/getOrg")
    @ResponseBody
    public String getDomain(Org ovo, Pcmangr pvo , HttpSession session, Model model)  throws IOException {
        logger.info("------ get doamin -----");
        List<Org> orgList = or.findByDomainOrderBySeq(ovo.getDomain());
        List<Object> treeList = new ArrayList <>();
        List<Pcmangr> pcList = pcr.findByDomain(ovo.getDomain());
        int i = 1;
    
        for( Org el : orgList){
            Map<String, Object> tree = new HashMap <String, Object>();
            // Map<String, Object> pctree = new HashMap <String, Object>();
            Map <String, Boolean> state = new HashMap <String, Boolean> ();
            
            if(el.getSeq() == 1 ){
                tree.put("id", el.getSeq());
                tree.put("parent", "#");
                tree.put("type", "root");
                tree.put("text", el.getOrgnm());
            }else{
                tree.put("id", el.getSeq());
                tree.put("parent", el.getPseq());
                tree.put("type", "default");
                tree.put("text", el.getOrgnm());
            }


            state.put("opened", true);
            tree.put("state", state);
            treeList.add(tree);
           
            for(Pcmangr pel:  pcList){
                Map<String, Object> pctree = new HashMap <String, Object>();
            
                if( tree.get("id") == pel.getOrgseq()){
                    
                    Map<String, Object> attr = new HashMap <String, Object>();
                    attr.put("data_quantity", pel.getSeq());

                    pctree.put("id", orgList.size()+i);
                    pctree.put("a_attr", attr);
                    pctree.put("parent", pel.getOrgseq());
                    pctree.put("type", "pc");
                    pctree.put("text", pel.getPchostname());

                    treeList.add(pctree);
                    i++;
                }
            
            }

            // logger.info("pctree > {}\n\n\n",pctree.get("id"));
            
        }

        

        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(treeList);
        // logger.info("jsonString >> {}",jsonString);

        return jsonString;        
	}


    @RequestMapping("/getPcDetail")
    @ResponseBody
    public List<Pcmangr> getPcDetail(@RequestParam("type") String type ,Org ovo, Pcmangr pvo , HttpSession session, Model model)  throws IOException {
        logger.info("\n\n\n\ngetDomain >> {}",pvo.getDomain());
        logger.info("orgseq >> {}",pvo.getOrgseq());
        logger.info("type >> {}",type);

        ovo.setChild(or.findSubOrgs(pvo.getDomain(), pvo.getOrgseq()));
        List <Pcmangr> subPcList = new ArrayList<>();
        List <Pcmangr> pList = new ArrayList<>();
        
        if(type.equals("pc")){
            subPcList = pcr.findAllByDomainAndSeq(pvo.getDomain(), pvo.getSeq());
            for(Pcmangr pc : subPcList){
                pc.setViewdate(pc.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
                pList.add(pc);
            }

        }else{ // root, default
            
            // 자신의 노드 밑에 있는  pc 검색
            if( !pcr.findAllByDomainAndOrgseq(pvo.getDomain(),pvo.getOrgseq()).isEmpty() ){
                for( Pcmangr e :  pcr.findAllByDomainAndOrgseq(pvo.getDomain(),pvo.getOrgseq())){
                    subPcList.add(e);
                }
            }

            //하위 노드가 있다면 해당 노드들의 pc리스트 검색
            for(Long el : ovo.getChild()){ 
                List <Pcmangr> pcs = pcr.findAllByDomainAndOrgseq(pvo.getDomain(),el);
                
                for(Pcmangr pc : pcs){
                    if(pc != null){
                        subPcList.add(pc);
                    }
                }
                            
            }
            logger.info("==================== ");


            for(Pcmangr pc : subPcList){
                logger.info("pc seq : {}" ,pc.getSeq());
                logger.info("pc hostname : {}" ,pc.getPchostname());

                pc.setViewdate(pc.getRgstrdate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
                pList.add(pc);
            }
    
        }
        
        return pList;        
	}

    @RequestMapping("/disable")
    @ResponseBody
    public String disable(User vo , HttpSession session, Model model)   {
        String retval="";
        
        logger.info("userid > {}",vo.getUserid());
        vo.setUpdtdate(LocalDateTime.now());
        vo.setStatus("IA");
        try {
            ur.updateStatus(vo);     
            retval = "S";
        } catch (Exception e) {
            logger.info("status update error",e );
            retval="F";
        }
       
        
        return retval;        
	}    

    @RequestMapping("/enable")
    @ResponseBody
    public String enable(User vo , HttpSession session, Model model)  throws IOException {
        String retval="";
        
        logger.info("userid > {}",vo.getUserid());
        vo.setUpdtdate(LocalDateTime.now());
        vo.setStatus("A");
        try {
            ur.updateStatus(vo);     
            retval = "S";
        } catch (Exception e) {
            logger.info("status update error" );
            retval="F";
        }
       
        
        return retval;        
	}    
}
