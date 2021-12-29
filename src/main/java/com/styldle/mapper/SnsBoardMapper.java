package com.styldle.mapper;

import com.styldle.vo.SnsCriteria;
import com.styldle.vo.SnsBoardVO;

import java.util.List;

public interface SnsBoardMapper {
    public List<SnsBoardVO> getList();
    public int insert(SnsBoardVO vo);
    public SnsBoardVO getOne(int postId);
    public int update(SnsBoardVO vo);
    public int delete(int postId);
//    public int insertSelectKey(SnsBoardVO vo);
    public List<SnsBoardVO> getListWithPaging(SnsCriteria cri);
    public int getTotalCount();
}
