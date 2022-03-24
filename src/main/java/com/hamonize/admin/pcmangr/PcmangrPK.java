package com.hamonize.admin.pcmangr;

import java.io.Serializable;

import lombok.Data;

@Data
public class PcmangrPK implements Serializable {
    private Long seq;
    private String domain;

}
