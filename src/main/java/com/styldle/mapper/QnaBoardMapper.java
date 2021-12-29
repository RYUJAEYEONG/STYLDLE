package com.styldle.mapper;

import com.styldle.vo.QnaBoardVO;
import com.styldle.vo.QnaCriteria;

import java.util.List;

public interface QnaBoardMapper {
    public List<QnaBoardVO> getList();
    public void insert(QnaBoardVO qnaBoard);
    public QnaBoardVO read(int boardNo);
    public int delete(int boardNo);
    public int update(QnaBoardVO qnaBoard);
    public boolean viewcnt(int boardNo);
    public List<QnaBoardVO> getListWithPaging(QnaCriteria cri);
    public int cntBoard(QnaCriteria cri);
    public void replyCnt(int boardNo);

}