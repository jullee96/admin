package com.hamonize.admin.org;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;


@Transactional
@EnableJpaRepositories
public interface OrgRepository extends JpaRepository<Org, String> {

    List<Org> findByDomain(String domain);

    List<Org> findByDomainOrderBySeq(String domain);

    List<Org> findByPseq(Long orgseq);


    @Query(
     value =
     " with recursive tbl_org_childs (seq) as "+
     " ( " +
     "  select p1.seq " +
     "  from tbl_org p1 "+
     "    where p1.domain = :domain and p1.p_seq = :orgseq " +
     " "+    
     "    union all " +
     " "+    
     "    select p2.seq  " + 
     "    from tbl_org p2, tbl_org_childs c" +
     "   where p2.domain = :domain and p2.p_seq = c.seq " +
     " "+
     " ) "+
     " select p.seq from tbl_org_childs p "
    , nativeQuery = true )
    List<Long> findSubOrgs(@Param("domain") String domain,@Param("orgseq") Long orgseq);

    
}
