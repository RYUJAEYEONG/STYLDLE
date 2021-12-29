package com.styldle.vo;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductAttachVO {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private int productId;
}
