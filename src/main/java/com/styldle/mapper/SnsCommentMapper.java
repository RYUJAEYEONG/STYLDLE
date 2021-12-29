package com.styldle.mapper;

import com.styldle.vo.SnsCriteria;
import com.styldle.vo.SnsCommentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SnsCommentMapper {
    public int insert(SnsCommentVO vo);
    public SnsCommentVO read(int commentId);
    public int delete(int commentId);
    public int update(SnsCommentVO vo);
    public List<SnsCommentVO> getListWithPaging(@Param("cri") SnsCriteria cri, @Param("postId") int postId);
    public int getCountByPostId(int postId);
}
