package com.styldle.service;

import com.styldle.vo.SnsCriteria;
import com.styldle.vo.ReplyPageDTO;
import com.styldle.vo.SnsCommentVO;

import java.util.List;

public interface SnsCommentService {
    public int register(SnsCommentVO vo);
    public int remove(int commentId);
    public int modify(SnsCommentVO vo);
    public List<SnsCommentVO> getList(SnsCriteria cri, int postId);
    public ReplyPageDTO getListPage(SnsCriteria cri, int postId);
    public int getCountByPostId(int postId);
}
