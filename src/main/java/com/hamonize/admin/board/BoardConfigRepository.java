package com.hamonize.admin.board;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface BoardConfigRepository extends JpaRepository<BoardConfig,String>{
    
}
