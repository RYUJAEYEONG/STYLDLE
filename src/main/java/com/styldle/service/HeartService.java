package com.styldle.service;

public interface HeartService {
    public int save(int postId, String userId);
    public int remove(int postId, String userId);
    public int getCount(int postId);
    public boolean isClicked(int postId, String userId);
}
