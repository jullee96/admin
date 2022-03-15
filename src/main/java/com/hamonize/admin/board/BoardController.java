package com.hamonize.admin.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping("/list")
    public String list(HttpSession session,BoardConfig vo) {
        logger.info("게시판 리스트 불러오기");
		return "/board/list";
	}

    @RequestMapping("/view")
    public String view(HttpSession session, BoardConfig vo) {
        logger.info("게시판 리스트 불러오기");
		

		return "/board/view";
	}

    @RequestMapping("/create")
    public String create(HttpSession session, BoardConfig vo) {
        logger.info("게시판 생성 페이지");
		

		return "/board/create";
	}
}
