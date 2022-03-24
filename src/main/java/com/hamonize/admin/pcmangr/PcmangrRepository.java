package com.hamonize.admin.pcmangr;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;


@Transactional
@EnableJpaRepositories
public interface PcmangrRepository extends JpaRepository<Pcmangr,String>{
    
}
