package com.hamonize.admin.board;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface BoardConfigRepository extends JpaRepository<BoardConfig,String>{

    BoardConfig getBySeq(Long seq);

    @Modifying
    @Query(
        value = "UPDATE tbl_board_config SET board_id = :#{#vo.boardid}, board_used = :#{#vo.boardused}, board_role = :#{#vo.boardrole}, board_type = :#{#vo.boardtype} , board_name = :#{#vo.boardname}, updt_date = :#{#vo.updtdate} WHERE seq = :#{#vo.seq} " , nativeQuery = true
    )
	void update(@Param("vo") BoardConfig vo);
    
}
