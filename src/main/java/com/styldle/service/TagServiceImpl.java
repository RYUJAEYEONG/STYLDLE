package com.styldle.service;

import com.styldle.mapper.TagMapper;
import com.styldle.vo.TagVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {
    @Setter(onMethod_ = @Autowired)
    private TagMapper mapper;

    @Override
    public List<TagVO> getList(int postId) {
        return mapper.getList(postId);
    }
}
