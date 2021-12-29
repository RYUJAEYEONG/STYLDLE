package com.styldle.service;

import com.styldle.mapper.QnaCommentMapper;
import com.styldle.vo.QnaCommentPageDTO;
import com.styldle.vo.QnaCommentVO;
import com.styldle.vo.QnaCriteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
public class QnaCommentServiceImpl implements QnaCommentService{
    @Setter(onMethod_=@Autowired)
    private QnaCommentMapper mapper;

    @Override
    public int register(QnaCommentVO vo) {
        return mapper.insert(vo);
    }

    @Override
    public QnaCommentVO get(int commentId) {
        return mapper.read(commentId);
    }

    @Override
    public int modify(QnaCommentVO vo) {
        return mapper.update(vo);
    }

    @Override
    public int remove(int commentId) {
        return mapper.delete(commentId);
    }

    @Override
    public List<QnaCommentVO> getList(QnaCriteria cri, int commentId) {
        return mapper.getListWithPaging(cri, commentId);
    }

    @Override
    public QnaCommentPageDTO getListPage(QnaCriteria cri, int boardNo) {
        return new QnaCommentPageDTO(
                mapper.cntByBoardNo(boardNo),
                mapper.getListWithPaging(cri, boardNo)
        );
    }
}
