package com.styldle.mapper;

import com.styldle.vo.HeartVO;
import org.apache.ibatis.annotations.Param;

public interface HeartMapper {
    public int save(@Param("postId") int postId, @Param("userId") String userId);
    public int remove(@Param("postId") int postId, @Param("userId") String userId);
    public int getCount(int postId);
    public HeartVO isClicked(@Param("postId") int postId, @Param("userId") String userId);
}
