package com.styldle.vo;

import lombok.Data;

@Data
public class SnsCommentVO {
    private int commentId;
    private int postId;
    private String comment;
    private String userId;
    private String date;
}
