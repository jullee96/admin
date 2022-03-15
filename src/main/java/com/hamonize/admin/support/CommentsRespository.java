package com.hamonize.admin.support;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentsRespository extends JpaRepository<Comments, String>{
    
    @Modifying
    @Query(
        value = "UPDATE tbl_support SET updt_date = :#{#vo.updtdate}, contents = :#{#vo.contents} WHERE seq = :#{#vo.seq} " , nativeQuery = true
    )
    int update(@Param("vo") Comments vo);

    List<Comments> findAllBySupportseq(Long seq);

    Comments findBySeq(Long seq);

    Boolean existsBySupportseq(Long sseq);

}
