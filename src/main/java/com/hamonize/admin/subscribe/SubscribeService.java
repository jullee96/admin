package com.hamonize.admin.subscribe;

import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
	private SubscribeRepostory sr;

    public Subscribe save(Subscribe vo){
        logger.info("SubscribeService");
        vo.setInsertdt(LocalDateTime.now());
        return sr.save(vo);
    }

    public int findSubscribeInfo (String userid){
        int ret = 0;
        List<Subscribe> sub = sr.findAllByUserid(userid);

        ret = sub.size();
        return ret;
    }

}
