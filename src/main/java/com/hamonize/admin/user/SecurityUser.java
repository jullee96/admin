package com.hamonize.admin.user;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

import org.springframework.security.core.userdetails.User;


@Getter
@Setter
public class SecurityUser extends User {

    private String userid;
    private String passwd;
    private String status;
    private String username;
    private String salt;
    private String email;

    // 결제정보
    private String domain;
    private int itemno;

    // sns
    private String name;
    private String picture;

    public SecurityUser(com.hamonize.admin.user.User user) {
        super(user.getUserid(), user.getPasswd(), makeGrantedAuthority()); 
        this.userid = user.getUserid();
        this.passwd = user.getPasswd();
        this.username = user.getUsername();
        this.salt = user.getSalt();
        this.domain = user.getDomain();
        this.email = user.getEmail();

    }

    private static Set<GrantedAuthority> makeGrantedAuthority() {
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(ROLE.USER.getValue()));

        return grantedAuthorities;
    }


}
