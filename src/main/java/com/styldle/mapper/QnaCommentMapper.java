package com.styldle.mapper;

import com.styldle.vo.QnaCommentVO;
import com.styldle.vo.QnaCriteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QnaCommentMapper {
    public int insert(QnaCommentVO vo);
    public QnaCommentVO read (int commentId);
    public int delete(int commentId);
    public int update (QnaCommentVO vo);
    public List<QnaCommentVO> getListWithPaging(
            @Param("cri")QnaCriteria cri,
            @Param("boardNo") int boardNo
            );
    public int cntByBoardNo(int boardNo);
}
