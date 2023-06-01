package com.ware.group.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Field3VO {
    private long field1;
    private String field2;
    private String field3;
    
    /**
     * 한번에 값 설정.     
     */
    public Field3VO() {
    }
    
    public Field3VO(long field1, String field2, String field3) {
        this.field1 = field1;
        this.field2 = field2;
        this.field3 = field3;
    }
    
}
