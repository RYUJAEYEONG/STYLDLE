package com.styldle.service;

import com.styldle.vo.SnsCriteria;
import com.styldle.vo.SnsBoardVO;
import com.styldle.vo.StyleImgVO;

import java.util.List;

public interface SnsBoardService {
    public void upload(SnsBoardVO vo);
    public List<SnsBoardVO> getList(SnsCriteria cri);
    public SnsBoardVO getOne(int postId);
    public void update(SnsBoardVO vo);
    public void remove(int postId);
    public StyleImgVO getStyleImg(int postId);
    public int getTotal();
}
