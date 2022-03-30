package com.hamonize.admin.board;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/board")
public class BoardController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    BoardConfigRepository bcr;

    @Autowired
    SitemapRepository smr;
    /***
     * 사이트 맵을 생성 > 메뉴을 생성 (타입, 권한등을 메뉴생성시에 같이)
     * @param vo
     * @return
     * @throws IOException
     */
    @RequestMapping("/list")
    @ResponseBody
    public String getBoardList(HttpSession session,BoardConfig vo) throws IOException {
        logger.info("사이트맵 + 메뉴 리스트 불러오기");

        Sitemap lastseq = smr.findAll((Sort.by(Sort.Direction.DESC, "smseq"))).get(0);
        
        List <Sitemap> slist = smr.findAll((Sort.by(Sort.Direction.ASC, "smseq")));
        List <BoardConfig> blist = bcr.findAll((Sort.by(Sort.Direction.ASC, "seq")));
        List<Object> treeList = new ArrayList <>();

        Map<String, Object> root = new HashMap <String, Object>();
        Map <String, Boolean> rootState = new HashMap <String, Boolean> ();
        int i = 1;
        
        root.put("id", 0);
        root.put("parent", "#");
        root.put("type", "root");
        root.put("text", "portal");
        rootState.put("opened", false);
        root.put("state", rootState);
            
        treeList.add(root);

        for(Sitemap el : slist){
            Map<String, Object> tree = new HashMap <String, Object>();
            Map <String, Boolean> state = new HashMap <String, Boolean> ();
            
            tree.put("id", el.getSmseq());
            tree.put("parent", 0);
            tree.put("type", "sitemap");
            tree.put("text", el.getSitemapname());
            state.put("opened", true);
            tree.put("state", state);
            treeList.add(tree);

            for(BoardConfig menu : blist){
                Map<String, Object> mtree = new HashMap <String, Object>();
                Map<String, Object> attr = new HashMap <String, Object>();
               
                if( menu.getPseq().equals(el.getSmseq())){
                    attr.put("data_quantity", menu);
                    
                    mtree.put("a_attr", attr);
                    mtree.put("id", lastseq.getSmseq()+i);
                    mtree.put("parent", menu.getPseq());
                    mtree.put("type", "menu");
                    mtree.put("text", menu.getBoardname());
                    treeList.add(mtree);
                    i++;
                }
            }


        }

        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(treeList);
    	return jsonString;
	}



    @RequestMapping("/create")
    public String create(HttpSession session, BoardConfig vo) {
        

		return "/board/create";
	}
    

    @RequestMapping("/saveSitemap")
    public String saveSitemap(HttpSession session, Sitemap vo) {
        logger.info("getSitemapname save...{}", vo.getSitemapname());
     
        vo.setRgstrdate(LocalDateTime.now());
        
        smr.save(vo);

		return "redirect:/board/create";
	}

    @RequestMapping("/editSitemap")
    public String getSitemapDetail(HttpSession session, Sitemap vo) {
        try {
            vo.setUpdtdate(LocalDateTime.now());
            smr.update(vo);  
           
        } catch (Exception e) {
           logger.info("error ");
        }
        

        return "redirect:/board/create";
	}

    
    @RequestMapping("/saveMenu")
    public String saveMenu(HttpSession session, BoardConfig vo) {
        logger.info("save...");
        logger.info("getBoardname >> {}", vo.getBoardname());
        logger.info("getUsed >> {}", vo.getBoardused());
        logger.info("getBoardrole >> {}", vo.getBoardrole());
        logger.info("pseq >> {}", vo.getPseq());
       
        vo.setRgstrdate(LocalDateTime.now());
        try {
            if(!vo.getBoardname().equals("")){
                bcr.save(vo);
            }
                 
        } catch (Exception e) {
            logger.info(" nulll ");
        }
       
		return "redirect:/board/create";
	}

    @RequestMapping("/editMenu")
    public String editMenu(HttpSession session, BoardConfig vo) {
        logger.info("editMenu...");
        logger.info("getBoardused >> {}", vo.getBoardused());
       
        try {
            vo.setUpdtdate(LocalDateTime.now());
            bcr.update(vo);
        } catch (Exception e) {
            logger.info(" nulll ");
        }
       

		return "redirect:/board/create";
	}


    @RequestMapping("/deleteMenu")
    public String deleteMenu(HttpSession session, BoardConfig vo) {
        logger.info("delete...");
        
        try {
            bcr.delete(vo);
        } catch (Exception e) {
            logger.info(" nulll ");
        }
       

		return "redirect:/board/create";
	}
}