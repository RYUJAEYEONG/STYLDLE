package com.styldle.vo;

import lombok.Data;

@Data
public class CartVO {
    private int cartId;
    private String userId;
    private int productId;
    private int count;
}
