package com.styldle.mapper;

import com.styldle.vo.TagVO;

import java.util.List;

public interface TagMapper {
    public int insert(TagVO vo);
    public int insertMany(TagVO vo);
    public List<TagVO> getList(int postId);
    public int delete(int tagId);
    public int deleteAll(int postId);
}
