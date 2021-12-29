package com.styldle.vo;

import lombok.Data;

@Data
public class CartListVO {
    private int cartId;
    private String userId;
    private int productId;
    private int count;
    private String productName;
    private int price;
    private String uuid;

}
