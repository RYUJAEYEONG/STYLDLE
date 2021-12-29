package com.styldle.mapper;

import com.styldle.vo.StyleImgVO;

public interface StyleImgMapper {
    public void insert(StyleImgVO vo);
    public StyleImgVO findByPostId(int postId);
    public void update(StyleImgVO vo);
    public void insertMany(StyleImgVO vo);
}
