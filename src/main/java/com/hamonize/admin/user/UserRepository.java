package com.hamonize.admin.user;

import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Transactional
@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    public Optional<User> findByUserid(String userid);
    public User findByUsername(String username);
    public Optional<User> findByEmail(String email);
    
    @Modifying
    @Query(
        value = "UPDATE tbl_admin_user SET domain = :domain WHERE user_id = :userid " , nativeQuery = true
    )
    public void updateDomain(@Param("domain") String domain, @Param("userid") String userid);
   
    @Modifying
    @Query(
        value = "UPDATE tbl_admin_user SET pass_wd = :#{#user.passwd} , salt = :#{#user.salt} , updt_date = :#{#user.updtDate} WHERE user_id = :#{#user.userid} " , nativeQuery = true
    )
    public void updatePasswd(@Param("user") User user);
    
    public Boolean existsByUsernameAndEmail(String username, String email);
    public Boolean existsByUseridAndEmail(String userid, String email);
    
    public User findByEmailAndUsername(String email, String username);
    public User findByEmailAndUserid(String email, String userid);
    
    public Boolean existsByEmail(String email);

    public Page<User> findAll(org.springframework.data.domain.Pageable pageable);

    public Page<User> findByRoleNot(org.springframework.data.domain.Pageable pageable, String string);

}
