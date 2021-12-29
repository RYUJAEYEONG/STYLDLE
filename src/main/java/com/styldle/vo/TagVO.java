package com.styldle.vo;

import lombok.Data;

@Data
public class TagVO {
    private int tagId;
    private int postId;
    private String tagName;
    private String link;

    private String title;
    private String image;
}
