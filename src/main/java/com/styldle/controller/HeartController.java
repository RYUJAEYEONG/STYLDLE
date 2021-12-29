package com.styldle.controller;

import com.styldle.service.HeartService;
import com.styldle.vo.HeartVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/heart/*")
@RestController
public class HeartController {
    @Setter(onMethod_ = @Autowired)
    HeartService service;

    @PostMapping(value = "/save",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> save(@RequestBody HeartVO vo) {
        int insertCount = service.save(vo.getPostId(), vo.getUserId());
        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/isClicked/{postId}/{userId}",
            produces = {MediaType.APPLICATION_JSON_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Boolean> isClicked(
            @PathVariable("postId") int postId,
            @PathVariable("userId") String userId) {
        return new ResponseEntity<>(service.isClicked(postId, userId), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{postId}/{userId}",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("postId") int postId, @PathVariable("userId") String userId) {
        return service.remove(postId, userId) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/cnt", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<Integer> getCount(int postId) {
        return new ResponseEntity<>(service.getCount(postId), HttpStatus.OK);
    }
}
