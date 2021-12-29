package com.styldle.vo;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaCommentVO {
    private int commentId;
    private String comment;
    private String userId;
    private int boardNo;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date regDate;
}
