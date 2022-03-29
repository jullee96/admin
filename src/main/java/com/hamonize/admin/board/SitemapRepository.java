package com.hamonize.admin.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public interface SitemapRepository extends JpaRepository<Sitemap, String>{

    @Modifying
    @Query(
        value = "UPDATE tbl_sitemap SET sitemap_name = :#{#vo.sitemapname}, updt_date = :#{#vo.updtdate} WHERE sm_seq = :#{#vo.smseq} " , nativeQuery = true
    )
    void update(@Param("vo") Sitemap vo);

    
}
