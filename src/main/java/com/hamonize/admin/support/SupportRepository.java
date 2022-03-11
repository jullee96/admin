package com.hamonize.admin.support;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface SupportRepository extends JpaRepository<Support, String>{

    Support findBySeq(Long long1);

    @Modifying
    @Query(
        value = "UPDATE tbl_support SET type = :#{#vo.type} , title = :#{#vo.title} , updt_date = :#{#vo.updtdate}, contents = :#{#vo.contents} WHERE seq = :#{#vo.seq} " , nativeQuery = true
    )
    int update(@Param("vo") Support vo);

    @Query(
        value = "SELECT * FROM tbl_support WHERE user_id = :userid " , nativeQuery = true
    )
    List<Support> findByUserid(@Param("userid") String userid);

    Page<Support> findAllByUserid(org.springframework.data.domain.Pageable pageable, String userid);

}
