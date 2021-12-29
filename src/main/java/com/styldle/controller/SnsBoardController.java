package com.styldle.controller;

import com.styldle.service.SnsBoardService;
import com.styldle.vo.*;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/style/*")
@Slf4j
public class SnsBoardController {
    @Setter(onMethod_ = @Autowired)
    private SnsBoardService snsBoardService;

    @GetMapping("/list")
    public String snsBoardList(SnsCriteria cri, Model model) {
        System.out.println("리스트 컨트롤러...." + cri);
        // 게시물 리스트 + 이미지 가져오기
        List<SnsBoardVO> list = snsBoardService.getList(cri);
        int total = snsBoardService.getTotal();
        list.forEach(i -> {
            int postId = i.getPostId();
            i.setStyleImgVO(snsBoardService.getStyleImg(postId));
        });
        System.out.println("list " + list);
        model.addAttribute("board", list);
        model.addAttribute("pageMaker", new SnsPageDTO(cri, total));
        return "/sns/list";
    }

    @GetMapping(value = "/{postId}",
            produces = {MediaType.APPLICATION_JSON_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<SnsBoardVO> getList(@PathVariable("postId") int postId) throws IOException {
        return new ResponseEntity<>(snsBoardService.getOne(postId), HttpStatus.OK);
    }

    @GetMapping(value = "/getStyleImg", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<StyleImgVO> getStyleImg(int postId) {
        return new ResponseEntity<>(snsBoardService.getStyleImg(postId), HttpStatus.OK);
    }

    @GetMapping("/upload")
    public String upload() {
        return "/sns/upload";
    }

    @PostMapping("/upload")
    public String upload(SnsBoardVO vo) {
        System.out.println("업로드 포스트...." + vo);
        snsBoardService.upload(vo);
        return "redirect:list";
    }

    //    @preAuthorize
    @GetMapping("/update")
    public String update(@RequestParam("postId") int postId, @ModelAttribute("cri") SnsCriteria cri, Model model, HttpServletRequest request) {
        model.addAttribute("post", snsBoardService.getOne(postId));
        model.addAttribute("img", snsBoardService.getStyleImg(postId));
        return "sns/update";
    }

    @PostMapping("/update")
    public String update(SnsBoardVO vo, @ModelAttribute("cri") SnsCriteria cri) {
        System.out.println("update 컨트롤러...." + vo);
        snsBoardService.update(vo);
        return "redirect:list" + cri.getListLink();
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("postId") int postId, @ModelAttribute("cri") SnsCriteria cri) {
        snsBoardService.remove(postId);
        return "redirect:list" + cri.getListLink();
    }

    @GetMapping("/tag")
    public String tag() {
        return "/sns/tag";
    }

}
