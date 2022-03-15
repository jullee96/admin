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
	@Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Comment("게시판 시퀀스 번호")
	private Long seq;
    
	@Comment("게시판 부모 시퀀스 번호")
    @Column(name = "p_seq")
	private Long pseq;

    @Column(name = "board_id")
    @Comment("게시판 구분 아이디")
	private String boardid;
    
    @Column(name = "type")
    @Comment("게시판 타입 > 게시판용 : B , 포스팅 용 : P ")
	private String type;

    @Column(name = "board_name")
    @Comment("게시판 이름")
	private String boardname;

    @Column(name = "rgstr_date")
    @Comment("게시판 생성일")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    @Comment("게시판 수정일")
    private LocalDateTime updtdate;

    @Column(name = "used", columnDefinition= "integer default 1")
    @Comment("게시판 사용여부 : 0이면 미사용중 1이면 사용중")
    private Integer used = 1;

    @Column(name = "board_role")
	@Comment("게시판 수정 권한 type : ADMIN, USER, ALL")
	private String boardrole;

    @Transient
    private String viewDate;

    @Transient
	private Integer sort;

}
