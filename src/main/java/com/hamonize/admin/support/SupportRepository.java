package com.hamonize.admin.support;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Page;
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

    @Modifying
    @Query(
        value = "UPDATE tbl_support SET status = :#{#vo.status} , updt_date = :#{#vo.updtdate} WHERE seq = :#{#vo.seq} " , nativeQuery = true
    )
    int updateStatus(@Param("vo") Support vo);

    @Query(
        value = "SELECT * FROM tbl_support WHERE user_id = :userid " , nativeQuery = true
    )
    List<Support> findByUserid(@Param("userid") String userid);

    Page<Support> findAllByUserid(org.springframework.data.domain.Pageable pageable, String userid);

    Page<Support> findByTitleContaining(org.springframework.data.domain.Pageable pageable, String keyword);

    List<Support> findByTitleContaining(String keyword);

    
    Page<Support> findByTitleContainingOrUseridContainingOrSeqContaining(org.springframework.data.domain.Pageable pageable, String keyword,
            String keyword2, Long keyword3);

    Page<Support> findByTitleContainingOrUseridContaining(org.springframework.data.domain.Pageable pageable, String keyword, String keyword2);

    Page<Support> findBySeq(org.springframework.data.domain.Pageable pageable, Long tmpLong);

    Page<Support> findByTitleContainingIgnoreCaseOrUseridContainingIgnoreCase(org.springframework.data.domain.Pageable pageable, String keyword,
            String keyword2);

    Page<Support> findAllByRgstrdateBetween(org.springframework.data.domain.Pageable pageable, LocalDateTime startDate, LocalDateTime endDate);

    Page<Support> findAllByRgstrdateLessThanEqual(org.springframework.data.domain.Pageable pageable, LocalDateTime endDate);

    Page<Support> findByStatus(org.springframework.data.domain.Pageable pageable, String status);

    Long countByRgstrdateBetween(LocalDateTime startDate, LocalDateTime endDate);

    Long countBySeq(Long tmpLong);

    Long countByTitleContainingIgnoreCaseOrUseridContainingIgnoreCase(String keyword, String keyword2);

    Page<Support> findAllByTitleContainingIgnoreCaseOrUseridContainingIgnoreCaseAndRgstrdateBetween(org.springframework.data.domain.Pageable pageable,
            String keyword, String keyword2, LocalDateTime startDate, LocalDateTime endDate);

    Long countByTitleContainingIgnoreCaseOrUseridContainingIgnoreCaseAndRgstrdateBetween(String keyword,
            String keyword2, LocalDateTime startDate, LocalDateTime endDate);

         
    
}
