package com.styldle.vo;

import lombok.*;

import java.sql.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderVO {
    private String orderId;
    private String userId;
    private String orderRec;
    private String postCode;
    private String roadAddress;
    private String detailAddress;
    private String orderPhone;
    private int total;
    private Date orderDate;
    private String delivery;
}
