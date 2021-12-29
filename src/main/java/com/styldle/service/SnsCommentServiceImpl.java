package com.styldle.service;

import com.styldle.mapper.SnsBoardMapper;
import com.styldle.mapper.SnsCommentMapper;
import com.styldle.vo.SnsCriteria;
import com.styldle.vo.ReplyPageDTO;
import com.styldle.vo.SnsCommentVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SnsCommentServiceImpl implements SnsCommentService {
    @Setter(onMethod_ = @Autowired)
    SnsCommentMapper mapper;

    @Setter(onMethod_ = @Autowired)
    SnsBoardMapper boardMapper;

    @Transactional
    @Override
    public int register(SnsCommentVO vo) {
        return mapper.insert(vo);
    }

    @Override
    public int remove(int commentId) {
        return mapper.delete(commentId);
    }

    @Override
    public int modify(SnsCommentVO vo) {
        return mapper.update(vo);
    }

    @Override
    public List<SnsCommentVO> getList(SnsCriteria cri, int postId) {
        return mapper.getListWithPaging(cri, postId);
    }

    @Override
    public ReplyPageDTO getListPage(SnsCriteria cri, int postId) {
        return new ReplyPageDTO(
                mapper.getCountByPostId(postId),
                mapper.getListWithPaging(cri, postId));
    }

    @Override
    public int getCountByPostId(int postId) {
        return mapper.getCountByPostId(postId);
    }
}
