package com.styldle.vo;

import lombok.*;

import java.sql.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderDetailVO {
    private int orderDetailNum;
    private String orderId;
    private int productId;
    private int count;
}
