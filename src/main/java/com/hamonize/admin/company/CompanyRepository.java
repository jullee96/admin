package com.hamonize.admin.company;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import io.lettuce.core.dynamic.annotation.Param;

@Transactional
public interface CompanyRepository extends JpaRepository<Company, String>{

    Company findByUserid(String userid);

    @Modifying
    @Query(
        value = "UPDATE tbl_company_list SET company_name = :#{#vo.companyName} , rprs_name = :#{#vo.rprsName}, business_number = :#{#vo.businessNumber} WHERE user_id = :#{#vo.userid} " , nativeQuery = true
    )
    int update(@Param("vo") Company vo);
    
}

