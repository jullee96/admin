package com.hamonize.admin.support;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Comment;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@SequenceGenerator(
            name="TBL_SUPPORT_SEQ_GEN",
            sequenceName="TBL_SUPPORT_SEQ",
            initialValue=1, 
            allocationSize=1                                
            )
@Table(name="tbl_support")
public class Support {
    
    @Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, 
            generator="TBL_SUPPORT_SEQ_GEN"     
            )
    @Comment("문의글 시퀀스 번호")
    private Long seq;

    @Size(max = 10)
    @Comment("구분 > 1:결제, 2: 기술 , 3: 기타 ")
    private String type;

    @Comment("유저 아이디")
    @Column(name = "user_id")
    private String userid;

    @Comment("이메일")
    private String email;

    @Comment("제목")
    private String title;

    @Comment("내용")
    @Column(columnDefinition="TEXT")
    private String contents;

    @Size(max = 10)
    @Comment("진행 상태 > W:답변대기 , P: 처리중, D:완료")
    private String status;


    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;
    
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Transient
    private String viewDate;

    @Transient
    private String startDate;

    @Transient
    private String endDate;

    @Comment("게시글에 사용된 이미지 시퀀스들")
    @Column(name = "img_seqs")
	private String imgseqs;
}
