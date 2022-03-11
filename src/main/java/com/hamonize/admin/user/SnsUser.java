package com.hamonize.admin.user;

import lombok.Builder;

public class SnsUser extends User {
	private String name;
    private String email;
    private String picture;
    private String role;

    @Builder
    public SnsUser(String name, String email, String picture, String role){
        this.name = name;
        this.email = email;
        this.picture = picture;
        this.role = role;
    }

    public SnsUser update(String name, String picture){
        this.name = name;
        this.picture = picture;

        return this;
    }

    public String getRoleKey(){
        return this.role;
    } 

}
