package com.styldle.service;

import com.styldle.mapper.QnaAttachMapper;
import com.styldle.mapper.QnaBoardMapper;
import com.styldle.mapper.QnaCommentMapper;
import com.styldle.vo.QnaBoardAttachVO;
import com.styldle.vo.QnaBoardVO;
import com.styldle.vo.QnaCriteria;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class QnaBoardServiceImpl implements QnaBoardService{
    @Setter(onMethod_=@Autowired)
    QnaBoardMapper mapper;

    @Setter(onMethod_=@Autowired)
    QnaAttachMapper attachMapper;

    @Override
    public List<QnaBoardVO> getList(QnaCriteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Transactional
    @Override
    public void register(QnaBoardVO qnaBoard) {
        System.out.println("boardService 등록중..........."+qnaBoard);
        mapper.insert(qnaBoard);
        if(qnaBoard.getAttachList() == null || qnaBoard.getAttachList().size() <= 0){
            return;
        }
        qnaBoard.getAttachList().forEach(attach->{
            attach.setBoardNo(qnaBoard.getBoardNo());
            attachMapper.insert(attach);
        });
    }

    @Override
    public QnaBoardVO get(int boardNo) {
        return mapper.read(boardNo);
    }

    @Transactional
    @Override
    public boolean modify(QnaBoardVO qnaBoard) {
        attachMapper.deleteAll(qnaBoard.getBoardNo());
        boolean modifyResult = mapper.update(qnaBoard) == 1;
        if(modifyResult && qnaBoard.getAttachList() != null && qnaBoard.getAttachList().size() > 0){
            qnaBoard.getAttachList().forEach(attach->{
                attach.setBoardNo(qnaBoard.getBoardNo());
                attachMapper.insert(attach);
            });
        }
        return modifyResult;
    }

    @Transactional
    @Override
    public boolean remove(int boardNo) {
        attachMapper.deleteAll(boardNo);
        return mapper.delete(boardNo) == 1;
    }

    @Override
    public boolean pluscnt(int boardNo) {
        return mapper.viewcnt(boardNo);
    }

    @Override
    public int cntBoard(QnaCriteria cri) {
        return mapper.cntBoard(cri);
    }

    @Override
    public List<QnaBoardAttachVO> getAttachList(int boardNo) {
        System.out.println("get AttachList by boardNo "+boardNo);
        return attachMapper.findByBoardNo(boardNo);
    }

    @Override
    public void replyCnt(int boardNo) {
        mapper.replyCnt(boardNo);
    }

}
