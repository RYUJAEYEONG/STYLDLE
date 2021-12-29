package com.styldle.service;

import com.styldle.vo.TagVO;

import java.util.List;

public interface TagService {
    public List<TagVO> getList(int postId);
}
