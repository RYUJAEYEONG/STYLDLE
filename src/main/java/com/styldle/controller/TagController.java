package com.styldle.controller;

import com.styldle.service.TagService;
import com.styldle.vo.TagVO;
import lombok.Setter;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RequestMapping("/tag/*")
@RestController
public class TagController {
    @Setter(onMethod_ = @Autowired)
    TagService service;

    @GetMapping(value = "/{postId}",
            produces = {MediaType.APPLICATION_JSON_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<TagVO>> getTagList(@PathVariable("postId") int postId) {
        List<TagVO> tagList = service.getList(postId);

        // 태그 url 크롤링
        tagList.forEach(i -> {
            Document doc = null;
            String url = i.getLink();
            try {
                doc = Jsoup.connect(url)
                        .userAgent("Mozilla/5.0")
                        .get();
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("에러 발생");
            }

            // 타이틀(og:title) 가져오기
            Elements ele = doc.select("meta[property=og:title]");
            String title = ele.isEmpty()
                    ? doc.select("title").text()
                    : ele.get(0).attr("content");
            i.setTitle(title);

            // 대표 이미지(og:image) 가져오기
            ele = doc.select("meta[property=og:image]");
            if (ele.isEmpty()) {
                ele = doc.select("link[rel=icon]");
                if (ele.isEmpty()) {
                    ele = doc.select("a img");
                    i.setImage(ele.attr("src"));
                } else {
                    i.setImage(ele.attr("href"));
                }
            } else {
                i.setImage(ele.get(0).attr("content"));
            }
        });

        return new ResponseEntity<>(tagList, HttpStatus.OK);
    }

}
