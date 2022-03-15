package com.hamonize.admin.support;


import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Comment;

import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "tbl_coments")
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("답변 시퀀스")
    private Long seq;

    @Comment("답변자 아이디")
    @Column(name = "user_id")
    private String userid;

    @Comment("코멘트 내용")
    @Column(columnDefinition="TEXT")
    private String comment;

    @Comment("문의글 번호")
    @Column(name = "support_seq")
    private Long supportseq;    

 
    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Transient
    private String viewDate;
}
