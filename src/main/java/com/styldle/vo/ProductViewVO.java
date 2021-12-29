package com.styldle.vo;

import lombok.*;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProductViewVO {
    private int productId;
    private String type;
    private String productName;
    private String detail;
    private int price;
    private int stock;
    private Date regDate;

    private String uuid;
    private String uploadPath;
    private String fileName;
}
