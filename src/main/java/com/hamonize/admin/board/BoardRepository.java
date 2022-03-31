package com.hamonize.admin.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface BoardRepository extends JpaRepository<Board,String>{

    Board getByBseq(Long seq);

    @Modifying
    @Query(
        value = "UPDATE tbl_boards SET b_content = :#{#vo.bcontent}, b_title = :#{#vo.btitle}, user_id = :#{#vo.userid}, updt_date = :#{#vo.updtdate} WHERE b_seq = :#{#vo.bseq} " , nativeQuery = true
    )
	void update(@Param("vo") Board vo);

    List<Board> findAllByBcseq(Sort sort, Long bcseq);
    
}
