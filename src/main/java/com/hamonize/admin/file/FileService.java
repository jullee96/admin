package com.hamonize.admin.file;

import java.time.LocalDateTime;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    FileRepository fr;

    public void upload(FileVO vo){
        vo.setRgstrdate(LocalDateTime.now());
        if(vo.getKeytype().equals("img")){
            
            if(fr.existsByUseridAndKeytype(vo.getUserid(), vo.getKeytype()) == true){ // 이미 있는 경우 update
                logger.info("update profile img");
                fr.update(vo.getFilename(),vo.getFilerealname(),vo.getFilepath(),vo.getFilesize(),vo.getUserid());
            
            } else{
                logger.info("save profile img");
                fr.save(vo);
            }

        } else{
            logger.info("other images save : {} ",vo.getKeytype());
            fr.save(vo);
        }

    }
}
