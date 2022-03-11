package com.hamonize.admin.subscribe;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubscribeRepostory extends JpaRepository<Subscribe, String>{
    List<Subscribe> findAllByUserid(String userid);

}
