package com.styldle.vo;

import lombok.Data;

@Data
public class UserCriteria {

    private int pageNum;
    private int amount;

    public UserCriteria()  {
        this(1, 10);
    }

    public UserCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

}
