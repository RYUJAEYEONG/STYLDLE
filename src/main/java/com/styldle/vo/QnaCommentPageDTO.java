package com.styldle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
@AllArgsConstructor
@Getter
public class QnaCommentPageDTO {
    private int replyCnt;
    private List<QnaCommentVO> list;
}
