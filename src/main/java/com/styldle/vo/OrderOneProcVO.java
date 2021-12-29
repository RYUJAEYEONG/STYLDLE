package com.styldle.vo;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderOneProcVO {
    private int productId;
    private String productName;
    private int price;
    private int count;
}
