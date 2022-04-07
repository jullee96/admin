package com.hamonize.admin.util;

import java.util.ArrayList;
import java.util.List;

import com.hamonize.admin.board.Board;
import com.hamonize.admin.board.BoardRepository;
import com.hamonize.admin.file.FileRepository;
import com.hamonize.admin.file.FileVO;
import com.hamonize.admin.support.Comments;
import com.hamonize.admin.support.CommentsRespository;
import com.hamonize.admin.support.Support;
import com.hamonize.admin.support.SupportRepository;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 
 * - 목적 : 주기적으로 tbl_files 테이블에 
 * 사용하지않는 이미지 삭제
 * - 주기 : 매일 오전 00:00시 시준
 * 
 */
@Component
@EnableAsync
public class Schedule {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    FileRepository fr;

    @Autowired
    BoardRepository br;

    @Autowired
    SupportRepository sr;

    @Autowired
    CommentsRespository cr;


    /** 
     *  지워야할 이미지 : commnet, support, board
     *  Cron 표현식을 사용한 작업 예약 
     * 초(0-59) 분(0-59) 시간(0-23) 일(1-31) 월(1-12) 요일(0-7) 
     * 
     */ 
    @Scheduled(cron = "0 0 0 * * *")
    public void deleteUnnecessaryFiles() throws Exception {
        long now = System.currentTimeMillis() / 1000; 
        logger.info("schedule tasks using cron jobs - {}", now); 

       List <String> list = fr.findByImgseqsNotNull();
       List <FileVO> flist = fr.findAll();
       String cmp ="";

        for(String el: list){
            cmp += el+",";
        }
       
       for( FileVO fel : flist){
           logger.info("contains? {}", cmp.contains(fel.getSeq().toString()));
            if(!cmp.contains(fel.getSeq().toString())){
                logger.info("remains...{}", fel.getSeq());
                fr.delete(fel);
            }else{
                logger.info("remains...{}", fel.getSeq());
            }     
       }
      
    }

}
