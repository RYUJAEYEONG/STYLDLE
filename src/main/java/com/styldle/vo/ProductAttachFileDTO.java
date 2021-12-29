package com.styldle.vo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductAttachFileDTO {
    private String fileName;
    private String uploadPath;
    private String uuid;
}
