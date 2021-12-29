package com.styldle.service;

import com.styldle.vo.QnaBoardAttachVO;
import com.styldle.vo.QnaBoardVO;
import com.styldle.vo.QnaCriteria;

import java.util.List;

public interface QnaBoardService {
    public List<QnaBoardVO> getList(QnaCriteria cri);
    public void register(QnaBoardVO qnaBoardVO);
    public QnaBoardVO get(int boardNo);
    public boolean modify(QnaBoardVO qnaBoard);
    public boolean remove(int boardNo);
    public boolean pluscnt(int boardNo);
    public int cntBoard(QnaCriteria cri);

    public List<QnaBoardAttachVO> getAttachList(int boardNo);
    public void replyCnt(int boardNo);


}
