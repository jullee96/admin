package com.hamonize.admin.board;

import java.time.LocalDateTime;

import javax.persistence.*;

import org.hibernate.annotations.Comment;

import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "tbl_sitemap")
public class Sitemap {
    @Id
	@Column(name = "sm_seq")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("사이트맵 시퀀스 번호")
    private Long smseq;

    @Column(name ="sm_name")
    private String sitemapname;

    @Comment("사이트냅 생성일")
    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;

    @Comment("사이트맵 수정일")
    @Column(name = "updt_date")
    private LocalDateTime updtdate;
    
}
