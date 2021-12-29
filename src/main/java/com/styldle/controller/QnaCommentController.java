package com.styldle.controller;

import com.styldle.service.QnaCommentService;
import com.styldle.vo.*;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/qna/replies/*")
@Log4j2
@AllArgsConstructor
public class QnaCommentController {
    private QnaCommentService service;

    @PostMapping(value = "/new",
            consumes = "application/json",
            produces = {MediaType.APPLICATION_JSON_VALUE,MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<TempVO> create(@RequestBody QnaCommentVO vo, HttpServletRequest request){
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        log.info("QnaCommentVO: "+vo);
        int insertCount = service.register(vo);
        TempVO tvo = new TempVO();
        //아이디를 보냄
        tvo.setIsFail("success");
        tvo.setUserId(userVO.getUserId());
//        tvo.setReplyCnt(boardVO.getReplyCnt());
//        System.out.println("tvo: "+tvo);
        return insertCount == 1
                ? new ResponseEntity<>(tvo, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/{commentId}",
        produces = {MediaType.APPLICATION_XML_VALUE,
        MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<QnaCommentVO> get(@PathVariable("commentId")int commentId){
        log.info("get: "+commentId);
        return new ResponseEntity<>(service.get(commentId), HttpStatus.OK);
    }
    @DeleteMapping(value = "/{commentId}",produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("commentId")int commentId){
        log.info("QnaComment 삭제: "+commentId);
        return service.remove(commentId) == 1
                ? new ResponseEntity<>("success",HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
        value = "/{commentId}",
    consumes = "application/json",
    produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(
            @RequestBody QnaCommentVO vo,
            @PathVariable("commentId") int commentId){
        vo.setCommentId(commentId);
        log.info("댓글 수정: "+vo );
        return service.modify(vo) == 1
                ? new ResponseEntity<>("success",HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @GetMapping(value = "/pages/{boardNo}/{page}",
        produces = {MediaType.APPLICATION_XML_VALUE,
                    MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<QnaCommentPageDTO> getList(@PathVariable("page") int page,
                                                     @PathVariable("boardNo") int boardNo){
        QnaCriteria cri = new QnaCriteria(page,10);
        System.out.println("replay controller 3)  cri,postId:  "+boardNo);
        int startNum = 0;
        if(cri.getPageNum()<=0){
            cri.setPageNum(1);
        } else{
            startNum=(cri.getPageNum()-1)* cri.getAmount();
            cri.setStartNum(startNum);
        }
        log.info("startNum: "+startNum);
        QnaCommentPageDTO list = service.getListPage(cri, boardNo);
        System.out.println("getlist servier in "+list);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }
}
