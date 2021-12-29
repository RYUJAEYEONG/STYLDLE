package com.styldle.service;

import com.styldle.mapper.HeartMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartServiceImpl implements HeartService {
    @Setter(onMethod_ = @Autowired)
    private HeartMapper mapper;

    @Override
    public int save(int postId, String userId) {
        return mapper.save(postId, userId);
    }

    @Override
    public int remove(int postId, String userId) {
        return mapper.remove(postId, userId);
    }

    @Override
    public int getCount(int postId) {
        return mapper.getCount(postId);
    }

    @Override
    public boolean isClicked(int postId, String userId) {
        return mapper.isClicked(postId, userId) != null;
    }
}
