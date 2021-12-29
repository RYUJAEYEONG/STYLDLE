package com.styldle.controller;

import com.styldle.service.QnaBoardService;
import com.styldle.vo.*;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RequestMapping("/qna")
@Controller
@Slf4j
public class QnaController {
    @Setter(onMethod_=@Autowired)
    QnaBoardService service;


    @GetMapping(value = "/list")
    public String getList(Model model, QnaCriteria cri,HttpServletRequest request) throws Exception{
        System.out.println("list 들어오나?"+cri);
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        cri.setAmount(cri.getAmount());
        int startNum;
        if(cri.getPageNum()<=0){
            cri.setPageNum(1);
        } else{
            startNum=(cri.getPageNum()-1)* cri.getAmount();
            cri.setStartNum(startNum);
        }
        List<QnaBoardVO> list = service.getList(cri);
        int total = service.cntBoard(cri);
        // 댓글수 계산
        list.forEach(i->service.replyCnt(i.getReplyCnt()));
        model.addAttribute("qna",list);
        model.addAttribute("paging",new QnaPagingVO(cri,total));
        return "/qna/list";
    }
    @PostMapping("/register")
    public String register(QnaBoardVO qnaBoard, RedirectAttributes rttr){
        service.register(qnaBoard);
        rttr.addFlashAttribute("result",qnaBoard.getUserId());
        System.out.println("------------register--------------");
        System.out.println("register : "+qnaBoard);
        if(qnaBoard.getAttachList() != null){
            qnaBoard.getAttachList().forEach(attach-> System.out.println("확인 "+attach));
        }
        System.out.println("-----------------------------------");
        return "redirect:/qna/list";
    }

    @GetMapping("/register")
    public String register(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        System.out.println("로그인세션: " + session.getAttribute("userVO"));
        if (userVO != null){
            log.info("새로운 로그인 성공");
            session.setAttribute("login",userVO);
        }
        return "/qna/register";
    }


    @GetMapping("/read")
    public void read(@RequestParam("boardNo") int boardNo, Model model,@ModelAttribute("cri") QnaCriteria cri,HttpServletRequest request){
        System.out.println("get 들어오니");
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        model.addAttribute("cri",cri);
        model.addAttribute("board",service.get(boardNo));
        // 조회수증가
        service.pluscnt(boardNo);
        // 댓글수 증가
        service.replyCnt(boardNo);
    }
    @GetMapping("/modify")
    public void modify(@RequestParam("boardNo") int boardNo, Model model,@ModelAttribute("cri") QnaCriteria cri,HttpServletRequest request){
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        model.addAttribute("userVO", userVO);
        System.out.println("modify,get 들어오니");
        model.addAttribute("cri",cri);
        model.addAttribute("board",service.get(boardNo));

    }
    @PostMapping("/modify")
    public String modify(QnaBoardVO qnaBoard, RedirectAttributes rttr, @ModelAttribute("cri") QnaCriteria cri){
        boolean result = service.modify(qnaBoard);
        if(result){
            rttr.addFlashAttribute("result","success");
        }

        System.out.println(qnaBoard.getBoardNo()+" pageNum: "+cri.getPageNum()+" amount: "+cri.getAmount());
        return "redirect:/qna/list"+cri.getListLink();
    }

    @GetMapping(value = "/getAttachList",
        produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<QnaBoardAttachVO>> getAttachList(int boardNo){
        System.out.println("컨트롤러 getAttachList: "+boardNo);
        return new ResponseEntity<>(service.getAttachList(boardNo), HttpStatus.OK);
    }

    private void deleteFiles(List<QnaBoardAttachVO> attachList){
        if(attachList == null || attachList.size() == 0){
            return;
        }
        System.out.println("delete attach files..........."+attachList);

        attachList.forEach(attach-> {
            try {
                Path file = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
                System.out.println("삭제 파일: "+file);
                Files.deleteIfExists(file);

                if(Files.probeContentType(file).startsWith("image")){
                    Path thumbNail = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
                    System.out.println("삭제 썸네일: "+thumbNail);
                    Files.delete(thumbNail);
                }
            } catch (Exception e){
                log.error("delete file error"+ e.getMessage());
            } //end catch
        }); //end forEach
    }
    @GetMapping("/remove")
    public String remove(@RequestParam("boardNo")int boardNo,@ModelAttribute("cri") QnaCriteria cri, RedirectAttributes rttr,HttpServletRequest request){
        System.out.println("삭제...."+boardNo);
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        List<QnaBoardAttachVO> attachList = service.getAttachList(boardNo);
        if(service.remove(boardNo)){
            System.out.println("성공제발들어오라");
            deleteFiles(attachList);
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/qna/list"+ cri.getListLink();
    }
}
