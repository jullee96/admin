package com.hamonize.admin.org;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;


@Transactional
@EnableJpaRepositories
public interface OrgRepository extends JpaRepository<Org, String> {

    List<Org> findByDomain(String domain);
    
}
