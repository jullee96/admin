package com.hamonize.admin.file;
import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Comment;

import lombok.*;

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

    @Column(name = "ins_date")
    private LocalDateTime insdate;

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
        this.insdate = LocalDateTime.now();
    }
    
}
