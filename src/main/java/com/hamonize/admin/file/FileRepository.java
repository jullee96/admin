package com.hamonize.admin.file;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import io.lettuce.core.dynamic.annotation.Param;

@Transactional
@Repository
public interface FileRepository extends JpaRepository<FileVO, String>{

    FileVO getBySeq(Integer seq);

    FileVO getByUserid(String userid);
    
    boolean existsByUserid(String userid);

    @Modifying
    @Query(
        value = "UPDATE tbl_files SET filename = :filename , filerealname = :filerealname, filepath = :filepath, filesize = :filesize WHERE userid = :userid " , nativeQuery = true
    )
    void update(@Param("filename") String filename, @Param("filerealname") String filerealname, @Param("filepath") String filepath, @Param("filesize") Long filesize,  @Param("userid") String userid);

    @Modifying
    @Query(
        value = "UPDATE tbl_files SET filepath = :#{#vo.filepath} WHERE userid = :#{#vo.userid} " , nativeQuery = true
    )
    void updateSnsImg(@Param("vo") FileVO vo);



    @Query(
        value = "SELECT * FROM tbl_files WHERE userid = :userid and keytype = :keytype " , nativeQuery = true
    )
    FileVO findByUseridAndKeytype(@Param("userid")  String userid, @Param("keytype")  String keytype);

    boolean existsByUseridAndKeytype(String userid, String string);

    FileVO findByUseridAndKeytypeAndSeq(String userid, String string, Integer seq);

    FileVO findByUseridAndSeq(String userid, Integer seq);

    FileVO findBySeqAndKeytype(int seq, String string);
}
