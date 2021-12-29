package com.styldle.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaImageVO {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private int boardNo;
}
