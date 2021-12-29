package com.styldle.vo;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaBoardVO {
    private int boardNo;
    private String userId;
    private String title;
    private String content;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date regDate;
    private int cnt;
    private int replyCnt;

    private List<QnaBoardAttachVO> attachList;
}
