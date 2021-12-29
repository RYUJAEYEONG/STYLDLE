package com.styldle.service;

import com.styldle.vo.QnaCommentPageDTO;
import com.styldle.vo.QnaCommentVO;
import com.styldle.vo.QnaCriteria;

import java.util.List;

public interface QnaCommentService {
    public int register(QnaCommentVO vo);
    public QnaCommentVO get(int commentId);
    public int modify (QnaCommentVO vo);
    public int remove(int commentId);
    public List<QnaCommentVO> getList(QnaCriteria cri, int commentId);
    public QnaCommentPageDTO getListPage(QnaCriteria cri,int boardNo);
}
