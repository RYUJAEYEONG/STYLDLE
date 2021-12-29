package com.styldle.controller;

import com.styldle.service.ProductService;
import com.styldle.service.QnaBoardService;
import com.styldle.service.SnsBoardService;
import com.styldle.service.UserService;
import com.styldle.vo.*;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;


@Controller
@RequestMapping("/styldle/*")
@AllArgsConstructor
public class UserController {
    @Autowired
    private UserService userService;

    @Setter(onMethod_ = @Autowired)
    private SnsBoardService snsBoardService;

    @Setter(onMethod_=@Autowired)
    QnaBoardService qnaBoardService;

    @Setter(onMethod_=@Autowired)
    ProductService productService;

    //메인
    @RequestMapping(value = "main", method = RequestMethod.GET)
    public void mainPageGET(@RequestParam(value = "userId", required = false) String userId, Model model) {
        System.out.println("메인 겟");
        model.addAttribute("user", userService.get(userId));

        // store 게시판 가져오기
        StoreCriteria storeCri = new StoreCriteria(1, 2);
        List<ProductVO> storeList = productService.getList(storeCri);
        model.addAttribute("storeList", storeList);

        // style 게시판 가져오기
        SnsCriteria snsCri = new SnsCriteria(1, 8);
        List<SnsBoardVO> styleList = snsBoardService.getList(snsCri);
        styleList.forEach(i -> {
            int postId = i.getPostId();
            i.setStyleImgVO(snsBoardService.getStyleImg(postId));
        });
        System.out.println("메인 스타일 list " + styleList);
        model.addAttribute("styleList", styleList);

        // qna 게시판 가져오기
        QnaCriteria qnaCri = new QnaCriteria(1, 5);
        int startNum;
        if(qnaCri.getPageNum()<=0){
            qnaCri.setPageNum(1);
        } else{
            startNum=(qnaCri.getPageNum()-1)* qnaCri.getAmount();
            qnaCri.setStartNum(startNum);
        }
        List<QnaBoardVO> qnaList = qnaBoardService.getList(qnaCri);
        model.addAttribute("qna", qnaList);
    }

    @RequestMapping(value = "main", method = RequestMethod.POST)
    public void mainPagePost(UserVO userVO, RedirectAttributes rttr) {
        System.out.println("메인 포스트");
    }

    //회원가입 처리
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String registerPost(UserVO userVO, String userId, RedirectAttributes redirectAttributes) throws Exception {
        //암호화
        // 암호화할 파라미터 반환
        String hashedPwd = BCrypt.hashpw(userVO.getPwd(), BCrypt.gensalt());
        userVO.setPwd(hashedPwd);
        System.out.println("등록 포스트");
        System.out.println(userVO);
        int idResult = userService.idCheck(userId);
        try{
            if(idResult ==1){
                System.out.println("중복");
                return "/styldle/register";
            } else if (idResult==0){
                userService.register(userVO);
                System.out.println("가능");
                return "redirect:/styldle/login";
            }
        } catch (Exception e){
            throw new RuntimeException();
        }
        return "redirect:/";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public void register() {
        System.out.println("등록 겟");
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public void getList(UserCriteria cri, HttpSession session, Model model) throws Exception {
        System.out.println("회원리스트 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        String role = userVO.getRole();
        session.setAttribute("role", role);
        List<UserVO> list = userService.getList(cri);
        int total = userService.getTotal();
        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new UserPageDTO(cri, total));
    }



    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updatePost2(UserVO userVO,  HttpSession session,RedirectAttributes rttr) {
        System.out.println("회원수정 포스트");
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        userService.update(userVO);
//        session.invalidate();
        System.out.println("수정될거"+userVO);
        return "redirect:/styldle/main";
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String updateGet2(@RequestParam(value = "userId", required = false) String userId, HttpSession session,Model model) {
        System.out.println("회원수정 겟");
        model.addAttribute("userVO", userService.get(userId));
        System.out.println(userId);
        return "/styldle/update";
    }

    //비밀번호 변경 로그인
    @RequestMapping(value = "pwdlogin", method = RequestMethod.GET)
    public void pwdLoginGet(HttpSession session) {
        System.out.println("비밀번호 로그인 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);

    }

    @RequestMapping(value = "pwdlogin", method = RequestMethod.POST)
    public String pwdLoginPost(LoginVO loginVO, HttpServletRequest request, RedirectAttributes rttr) {
        System.out.println("비밀번호 로그인 포스트");
        System.out.println(loginVO);
        HttpSession session = request.getSession();
        UserVO userVO = userService.login(loginVO);
        if (userVO == null || !BCrypt.checkpw(loginVO.getPwd(), userVO.getPwd())) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/styldle/pwdlogin";
        }
        session.setAttribute("userVO", userVO);
        return "redirect:/styldle/pwdupdate";
    }

    //비밀번호수정
    @RequestMapping(value = "pwdupdate", method = RequestMethod.POST)
    public String pwdUpdatePost(UserVO userVO,  HttpSession session, RedirectAttributes rttr) {
        System.out.println("비밀번호 수정 포스트");
        String hashedPwd = BCrypt.hashpw(userVO.getPwd(), BCrypt.gensalt());
        userVO.setPwd(hashedPwd);
        userService.pwdUpdate(userVO);
        System.out.println(userVO);
        return "redirect:/styldle/main";
    }

    @RequestMapping(value = "pwdupdate", method = RequestMethod.GET)
    public String pwdUpdateGet(HttpSession session) {
        System.out.println("비밀번호 수정 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        return null;
    }

    //회원탈퇴
    @RequestMapping(value = "userdelete", method = RequestMethod.POST)
    public String userDeletePost(LoginVO loginVO, HttpServletRequest request, RedirectAttributes rttr) {
        System.out.println("탈퇴 포스트");
        System.out.println(loginVO);
        HttpSession session = request.getSession();
        UserVO userVO = userService.login(loginVO);
        if (userVO == null || !BCrypt.checkpw(loginVO.getPwd(), userVO.getPwd())) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/styldle/userdelete";
        }
        session.setAttribute("userVO", userVO);
        userService.userDelete(loginVO);
        return "redirect:/styldle/logout";
    }

    @RequestMapping(value = "userdelete", method = RequestMethod.GET)
    public void userdeleteGet(HttpSession session) {
        System.out.println("탈퇴 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        session.setAttribute("userVO", userVO);
    }

    //회원 강퇴
    @ResponseBody
    @RequestMapping(value = "userban", method = RequestMethod.POST)
    public int userBan(HttpSession session,
                       @RequestParam(value = "chbox[]") List<String> chArr, UserVO userVO, Model model) throws Exception {
        System.out.println("딜리트카트");
        String userId = userVO.getUserId();
        int result = 0;
        if (userVO != null) {
            userVO.setUserId(userId);
            for (String i : chArr) {
                userId = i;
                userVO.setUserId(userId);
                userService.userBan(userVO);
            }
            System.out.println("강퇴되는 회원" + userVO);
            result = 1;
        }
        return result;
    }

    //로그인
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void loginGet(HttpSession session) {
        System.out.println("로그인 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        session.setAttribute("userVO", userVO);
    }

    //로그인
    @RequestMapping(value = "chatting")
    public void chat2(HttpSession session) {
        System.out.println("채팅 겟");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        session.setAttribute("userVO", userVO);
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public Object loginPost(LoginVO loginVO, HttpServletRequest request, RedirectAttributes rttr) {
        System.out.println("로그인 포스트");
        System.out.println(loginVO);
        HttpSession session = request.getSession();
//      UserVO lvo = userService.login(userVO);
        UserVO userVO = userService.login(loginVO);
        if (userVO == null || !BCrypt.checkpw(loginVO.getPwd(), userVO.getPwd())) {
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/styldle/login";
        }
        session.setAttribute("userVO", userVO);
        return "redirect:/styldle/main";
    }

    //로그아웃
    @RequestMapping("logout")
    public String logout() {
        System.out.println("로그아웃");
        return "/styldle/logout";
    }



    @RequestMapping(value = "rock", method = RequestMethod.GET)
    public void rockPageGET(@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model) {
        System.out.println("가위바위보 겟");
        session.setAttribute("userId", userId);
        model.addAttribute("userVO", userService.get(userId));
    }

    //가위바위보
    @RequestMapping(value = "win", method = RequestMethod.POST)
    public String win(UserVO userVO, HttpSession session, RedirectAttributes rttr) {
        System.out.println("승리 포스트");
        userService.updateWin(userVO);
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        return "redirect:/styldle/rock";
    }


    @RequestMapping(value = "draw", method = RequestMethod.POST)
    public String draw(UserVO userVO, HttpSession session, RedirectAttributes rttr) {
        System.out.println("무승부 포스트");
        userService.updateDraw(userVO);
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        return "redirect:/styldle/rock";
    }



    @RequestMapping(value = "lose", method = RequestMethod.POST)
    public String lose(UserVO userVO, HttpSession session, RedirectAttributes rttr) {
        System.out.println("패배 포스트");
        userService.updateLose(userVO);
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        return "redirect:/styldle/rock";
    }



    @ResponseBody
    @RequestMapping(value = "idcheck", method = RequestMethod.POST)
    public int idcheck(String userId) {
        int result = userService.idCheck(userId);
        return result;
    }


    @RequestMapping(value = "idcheck", method = RequestMethod.GET)
    public void idcheck() {
        System.out.println("idcheck 겟");
    }

    //채팅
    @RequestMapping("chat")
    public ModelAndView chat() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chat");
        return mv;
    }

    //마이페이지
    @RequestMapping(value = "mypage", method = RequestMethod.GET)
    public String mypage(@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model) {
        System.out.println("마이페이지 겟");
        System.out.println("유저아이디"+userId);
        model.addAttribute("userVO", userService.get(userId));
        return "/styldle/mypage";
    }

    // 주문 조회
    @RequestMapping(value = "orderlist", method = RequestMethod.GET)
    public void orderList(HttpSession session, Model model)  {
        System.out.println("주문조회");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        List<OrderListVO> orderList = userService.orderList(userId);
        model.addAttribute("orderList", orderList);
    }

    // 카트 목록
    @RequestMapping(value = "cartlist", method = RequestMethod.GET)
    public void getCartList(UserCriteria cri, HttpSession session, Model model) {
        System.out.println("카트리스트");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        session.setAttribute("userId", userId);
        System.out.println("아이디"+userId);
        List<CartListVO> list = userService.cartList(userId);
        model.addAttribute("list", list);
    }

    @RequestMapping(value = "getcart", method = RequestMethod.POST)
    public String getcart(CartListVO cartListVO,  HttpSession session,RedirectAttributes rttr) {
        System.out.println("카트수정 포스트");
        int cartId = cartListVO.getCartId();
        session.setAttribute("cartId", cartId);
        userService.updateCart(cartListVO);
        System.out.println("수정될거"+cartListVO);
        return "redirect:/styldle/cartlist";
    }

    @RequestMapping(value = "getcart", method = RequestMethod.GET)
    public String getcart(@RequestParam(value = "cartId", required = false) int cartId, HttpSession session,Model model) {
        System.out.println("카트수정 겟");
        model.addAttribute("cartListVO", userService.getCart(cartId));
        System.out.println(cartId);
        return "/styldle/getcart";
    }

    @RequestMapping(value = "updatecart", method = RequestMethod.POST)
    public String updateCartPost(CartListVO cartListVO,  HttpSession session,RedirectAttributes rttr) {
        System.out.println("업데이트카트 포스트");
        int cartId = cartListVO.getCartId();
        session.setAttribute("cartId", cartId);
        System.out.println(cartListVO);
        userService.cartUpdate(cartListVO);
        return "redirect:/styldle/cartList";
    }

    @RequestMapping(value = "updatecart", method = RequestMethod.GET)
    public void updateCartGet(HttpSession session) {
        System.out.println("업데이트카트 겟");
        CartListVO cartListVO = (CartListVO) session.getAttribute("cartList");
        int cartId = cartListVO.getCartId();
        session.setAttribute("cartId", cartId);

    }

    // 카트 삭제
    @ResponseBody
    @RequestMapping(value = "deletecart", method = RequestMethod.POST)
    public int deleteCart(HttpSession session,
                          @RequestParam(value = "chbox[]") List<String> chArr, CartListVO cartListVO, Model model) throws Exception {
        System.out.println("카트 삭제 포스트");
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        String userId = userVO.getUserId();
        int result = 0;
        int cartId = 0;
        if (userVO != null) {
            cartListVO.setUserId(userId);
            for (String i : chArr) {
                cartId = Integer.parseInt(i);
                cartListVO.setCartId(cartId);
                userService.deleteCart(cartListVO);
            }
            System.out.println("딜리트될거" + cartListVO);
            result = 1;
        }
        return result;
    }

}
