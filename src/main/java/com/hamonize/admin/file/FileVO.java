package com.hamonize.admin.file;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@SequenceGenerator(
            name="TBL_FILES_SEQ_GEN",
            sequenceName="TBL_FILES_SEQ_SEQ1",
            initialValue=3, //시작값
            allocationSize=1                                
            )
@Table(name="tbl_files")
public class FileVO {
    
    @Id
    @GeneratedValue(
        strategy=GenerationType.SEQUENCE, 
        generator="TBL_FILES_SEQ_SEQ1"     
        )
    @Comment("파일 시퀀스 번호")
    private Integer seq; 

    private String filename;
    private String filerealname;
    private long filesize;
    private String filepath;
    private String keytype;
    private String userid;

    @Column(name = "rgstr_date")
    private LocalDateTime rgstrdate;

    /**
     * 파일 크기를 정형화하기.
     */
    public String size2String() {
        Integer unit = 1024;
        if (filesize < unit) {
            return String.format("(%d B)", filesize);
        }
        int exp = (int) (Math.log(filesize) / Math.log(unit));

        return String.format("(%.0f %s)", filesize / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
    }

    @PrePersist
    public void createdAt() {
        this.rgstrdate = LocalDateTime.now();
    }
    
}
