package com.styldle.vo;

import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SnsBoardVO {
    private int postId;
    private String userId;
    private String content;
    private String date;

    private StyleImgVO styleImgVO;
    private List<TagVO> tagList;

    public SnsBoardVO setPostId(int postId) { this.postId = postId;return this; }
    public SnsBoardVO setUserId(String userId) {this.userId = userId;return this;}
    public SnsBoardVO setContent(String content) {this.content = content;return this;}
    public SnsBoardVO setDate(String date) {this.date = date;return this;}
}
