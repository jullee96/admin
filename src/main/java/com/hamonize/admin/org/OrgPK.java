package com.hamonize.admin.org;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrgPK implements Serializable {
    
    private Long seq;
    private String domain;
}
