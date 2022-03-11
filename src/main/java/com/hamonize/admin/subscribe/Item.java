package com.hamonize.admin.subscribe;

import javax.persistence.*;

import org.hibernate.annotations.Comment;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="tbl_item")
public class Item {

    @Id
    @Column(name = "item_no")
    @Comment("구매한 아이템 번호")
    private int itemno;
    
    @Column(name = "item_name")
    @Comment("구매한 아이템 이름")
    private String itemname;

    @Column(name = "item_info")
    @Comment("구매한 아이템 정보")
    private String iteminfo;
    
    @Comment("아이템 금액")
    private int price;   
}
