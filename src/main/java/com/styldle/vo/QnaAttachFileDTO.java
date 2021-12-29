package com.styldle.vo;

import lombok.Data;

@Data
public class QnaAttachFileDTO {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;
}
