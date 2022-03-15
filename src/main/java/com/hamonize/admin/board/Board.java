package com.hamonize.admin.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Comment;

import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "tbl_boards")
public class Board {
    
    @Id
	@Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("게시글 시퀀스 번호")
    private Long seq;

    @Comment("게시글 제목")
	private String title;

    @Comment("게시판 내용")
    private String contents;

    @Comment("게시글 작성자 아이디")
    @Column(name = "user_id")
	private String userid;

    @Comment("게시글 등록일")
    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;

    @Comment("게시글 수정일")
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Comment("게시글 조회수")
    @Column(name = "view_cnt", columnDefinition= "integer default 0" )
    private Integer viewcnt = 0;

    @Transient
    private String viewDate;

    @Comment("게시판 구분 아이디")
	@OneToOne
    @JoinColumn(name = "board_id")
    BoardConfig boardConfig;

}
