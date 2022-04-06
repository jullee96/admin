package com.hamonize.admin.board;

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
@Table(name = "tbl_board_config")
public class BoardConfig {
    
    @Id
	@Column(name = "bc_seq")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Comment("게시판 시퀀스 번호")
	private Long bcseq;
    
	@Comment("게시판 부모 시퀀스 번호")
    @Column(name = "p_seq")
	private Long pseq;

    @Column(name = "bc_id")
    @Comment("게시판 구분 아이디")
	private String bcid;
    
    @Column(name = "bc_type")
    @Comment("게시판 타입 > 게시판용 : B , 포스팅 용 : P ")
	private String bctype;

    @Column(name = "bc_name")
    @Comment("게시판 이름")
	private String bcname;

    @Column(name = "rgstr_date")
    @Comment("게시판 생성일")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    @Comment("게시판 수정일")
    private LocalDateTime updtdate;

    @Column(name = "bc_used", columnDefinition= "integer default 1")
    @Comment("게시판 사용여부 : 0이면 미사용중 1이면 사용중")
    private Integer bcused = 1;

    @Column(name = "bc_role")
	@Comment("게시판 보기 권한 type : ADMIN, USER, ALL")
	private String bcrole;

    @Column(name = "bc_domains")
	@Comment("게시판을 보여줄 상세 도메인들")
	private String bcdomains;

    @Transient
    private String viewDate;

    @Transient
	private Integer sort;

}
