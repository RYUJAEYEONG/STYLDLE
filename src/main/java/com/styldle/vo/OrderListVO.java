package com.styldle.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class OrderListVO {
    private String orderId;
    private String userId;
    private int productId;
    private String orderRec;
    private int total;
    private String postCode;
    private String roadAddress;
    private String detailAddress;
    private String orderPhone;
    private Date orderDate;
    private String delivery;

}
