package com.hamonize.admin.org;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.hamonize.admin.pcmangr.Pcmangr;

import org.hibernate.annotations.Comment;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@IdClass(OrgPK.class)
@Table(name="tbl_org")
public class Org { 

    @Id
    @Comment("부서 시퀀스 번호")
    private String domain;
    
    @Id
    @Comment("부서 시퀀스 번호")
    private Long seq;
    
    @Comment("부서이름")
    @Column(name = "org_nm")
    private String orgnm;

    @Comment("상위 부서번호")
    @Column(name = "p_seq")
    private String pseq;

    @Comment("상위 부서이름")
    @Column(name = "p_org_nm")
    private String porgnm;

    @Comment("모든 부서이름")
    @Column(name = "all_org_nm")
    private String allorgnm;

    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Transient
    private String viewDate;


    @Transient
    private List <Long> child = new ArrayList<>();

    @Transient
    @OneToMany(fetch = FetchType.LAZY)
    private List <Pcmangr> pcs = new ArrayList<>();

}
