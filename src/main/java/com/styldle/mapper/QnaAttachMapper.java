package com.styldle.mapper;

import com.styldle.vo.QnaBoardAttachVO;

import java.util.List;

public interface QnaAttachMapper {
    public void insert(QnaBoardAttachVO vo);
    public void delete(String uuid);
    public List<QnaBoardAttachVO> findByBoardNo(int boardNo);

    public void deleteAll(int boardNo);
}
