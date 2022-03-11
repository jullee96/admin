package com.hamonize.admin.company;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Comment;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name="tbl_company_list")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long seq;
    /** 회사정보 */
	@Column(name = "company_name")
	@Comment("회사명")
	private String companyName;
	
	@Column(name = "rprs_name")
	@Comment("대표명")
	private String rprsName;

	@Size(max=50)
	@Column(name = "business_number")
	@Comment("사업자 번호")
	private String businessNumber;

	@Column(name = "user_id")
	private String userid;
}

