package com.hamonize.admin.pcmangr;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Comment;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@IdClass(PcmangrPK.class)
@Table(name="tbl_pc_mangr")
public class Pcmangr {
    
    @Id
    @Comment("pc 도메인")
    private String domain;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("pc 시퀀스 번호")
    private Long seq;
    
    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Transient
    private String viewDate;
}
