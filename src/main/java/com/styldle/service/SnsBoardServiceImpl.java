package com.styldle.service;

import com.styldle.mapper.SnsBoardMapper;
import com.styldle.mapper.StyleImgMapper;
import com.styldle.mapper.TagMapper;
import com.styldle.vo.*;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class SnsBoardServiceImpl implements SnsBoardService {
    @Setter(onMethod_ = @Autowired)
    SnsBoardMapper snsBoardMapper;

    @Setter(onMethod_ = @Autowired)
    StyleImgMapper styleImgMapper;

    @Setter(onMethod_ = @Autowired)
    TagMapper tagMapper;

    @Transactional
    @Override
    public void upload(SnsBoardVO vo) {
        System.out.println("서비스 upload ....");
        // 게시글 추가
        snsBoardMapper.insert(vo);
//        int postId = vo.getPostId();
//        System.out.println("포스트 아이디: " + postId);
        // 이미지 추가
        StyleImgVO styleImgVO = vo.getStyleImgVO();
//        styleImgVO.setPostId(postId);
        styleImgMapper.insert(styleImgVO);
        // 태그 추가
        List<TagVO> tagList = vo.getTagList();
        if (tagList != null) {
            tagList.forEach(i -> {
//                i.setPostId(postId);
                tagMapper.insert(i);
            });
        }
    }

    @Transactional
    @Override
    public void update(SnsBoardVO vo) {
        System.out.println("서비스 update...." + vo);
        // 게시글 수정
        snsBoardMapper.update(vo);
        // 이미지 수정
        StyleImgVO img = vo.getStyleImgVO();
        int postId = vo.getPostId();
        img.setPostId(postId);
        styleImgMapper.update(vo.getStyleImgVO());
        // 태그 삭제 후 재추가
        List<TagVO> tagList = vo.getTagList();
        System.out.println("tagList: " + tagList);
        tagMapper.deleteAll(postId);
        if (tagList != null) {
            tagList.forEach(i -> {
                i.setPostId(postId);
                System.out.println("추가 " + i);
                tagMapper.insertMany(i);
            });
        }
    }

    @Override
    public List<SnsBoardVO> getList(SnsCriteria cri) {
        int startNum = (cri.getPageNum() - 1) * cri.getAmount();
        cri.setStartNum(startNum);
        System.out.println("getList 서비스...." + cri);
        return snsBoardMapper.getListWithPaging(cri);
    }

    @Override
    public SnsBoardVO getOne(int postId) {
        SnsBoardVO vo = snsBoardMapper.getOne(postId);
        List<TagVO> tagList = tagMapper.getList(postId);
        vo.setTagList(tagList);
        return vo;
    }

    @Override
    public void remove(int postId) {
        snsBoardMapper.delete(postId);
    }

    @Override
    public StyleImgVO getStyleImg(int postId) {
        return styleImgMapper.findByPostId(postId);
    }

    @Override
    public int getTotal() {
        return snsBoardMapper.getTotalCount();
    }
}
