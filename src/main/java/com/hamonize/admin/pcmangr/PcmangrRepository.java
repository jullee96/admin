package com.hamonize.admin.pcmangr;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;


@Transactional
@EnableJpaRepositories
public interface PcmangrRepository extends JpaRepository<Pcmangr,String>{

    List<Pcmangr> findByDomain(String domain);

    List<Pcmangr> findByDomainAndOrgseq(String domain, Long orgseq);
    
    @Query(
        value = "select * from tbl_pc_mangr where domain = :domain and org_seq = :orgseq  ", nativeQuery = true
    )
    Pcmangr getByDomainAndOrgseq(@Param("domain") String domain, @Param("orgseq") Long orgseq);

    // Pcmangr findByDomainAndOrgseq(String domain, Long orgseq);

    
}
