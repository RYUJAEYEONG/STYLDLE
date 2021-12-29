package com.styldle.controller;

import com.styldle.service.SnsCommentService;
import com.styldle.vo.SnsCriteria;
import com.styldle.vo.ReplyPageDTO;
import com.styldle.vo.SnsCommentVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/replies/*")
@RestController
@Log4j2
@AllArgsConstructor
public class SnsCommentController {
    @Setter(onMethod_ = @Autowired)
    SnsCommentService service;

    @PostMapping(value = "/new",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody SnsCommentVO vo) {
        int insertCount = service.register(vo);
        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/pages/{postId}/{page}",
            produces = {MediaType.APPLICATION_JSON_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<ReplyPageDTO> getList(
            @PathVariable("page") int page,
            @PathVariable("postId") int postId) {
        SnsCriteria cri = new SnsCriteria(page, 10);
        return new ResponseEntity<>(service.getListPage(cri, postId), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{commentId}",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("commentId") int commentId) {
        return service.remove(commentId) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value = "/{commentId}",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(
            @RequestBody SnsCommentVO vo,
            @PathVariable("commentId") int commentId) {
        vo.setCommentId(commentId);
        return service.modify(vo) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/cnt", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<Integer> getCountByPostId(int postId) {
        return new ResponseEntity<>(service.getCountByPostId(postId), HttpStatus.OK);
    }

}
