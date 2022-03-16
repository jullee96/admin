package com.hamonize.admin.support;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface CommentsRespository extends JpaRepository<Comments, String>{
    
    @Modifying
    @Query(
        value = "UPDATE tbl_comments SET updt_date = :#{#vo.updtdate}, comment = :#{#vo.comment} WHERE seq = :#{#vo.seq} " , nativeQuery = true
    )
    int update(@Param("vo") Comments vo);

    List<Comments> findAllBySupportseq(Long seq);

    Comments findBySeq(Long seq);

    Boolean existsBySupportseq(Long sseq);

}
