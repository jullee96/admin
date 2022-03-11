package com.hamonize.admin.company;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    CompanyRepository cr;

    public void update(Company vo){
        Company tmp = cr.findByUserid(vo.getUserid());
        
        if(tmp != null){
            if(vo.getBusinessNumber() == null || "".equals(vo.getBusinessNumber())){
                vo.setBusinessNumber(tmp.getBusinessNumber());
            } else if(vo.getCompanyName()== null || "".equals(vo.getCompanyName())){
                vo.setCompanyName(tmp.getCompanyName());
            } else if(vo.getRprsName() ==null || "".equals(vo.getRprsName())){
                vo.setRprsName(tmp.getRprsName());
            }
            
            
            logger.info("vo >> {} ", vo.getCompanyName());
            logger.info("vo >> {} ", vo.getRprsName());
            logger.info("vo >> {} ", vo.getBusinessNumber());
            
            cr.update(vo);
        }else{
            cr.save(vo);

        }

    }
}
