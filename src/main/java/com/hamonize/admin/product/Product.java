package com.hamonize.admin.product;

import java.time.LocalDateTime;

import javax.persistence.*;

import org.hibernate.annotations.Comment;

import lombok.*;

@Getter
@Setter
@Entity
@Table(name="tbl_products")
public class Product {
  
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Comment("제품 시퀀스 번호")
    @Column(name = "pd_id")
    private Long pdid; 
   
    @Comment("제품 이름")
    @Column(name = "pd_name")
    private String pdname;

    @Comment("제품 가격")
    @Column(name = "pd_price")
    private Integer pdprice;
   
    @Comment("제품 설명")
    @Column(name = "pd_info",columnDefinition="TEXT")
    private String pdinfo;

    @Comment("제품 설명")
    @Column(name = "pd_feature",columnDefinition="varchar(255)")
    private String pdfeature;

    @Comment("제품 등록일")
    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;

    @Comment("제품 수정일")
    @Column(name = "updt_date")
    private LocalDateTime updtdate;

    @Transient
    private String viewDate;

}
