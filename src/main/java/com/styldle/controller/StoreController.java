package com.styldle.controller;

import com.google.gson.Gson;
import com.styldle.service.ProductService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/store/*")
@Slf4j
public class StoreController {

    @Setter(onMethod_=@Autowired)
    ProductService service;

    @GetMapping("/register")
    public String getRegister(){
        System.out.println("등록 get");
        return "store/register";
    }

    @PostMapping("/register")
    public String postRegister(ProductVO product, RedirectAttributes rttr){
        System.out.println("등록 post");
        if(product.getAttachList() != null){
            product.getAttachList().forEach(i -> System.out.println(i));
        }
        service.register(product);
        rttr.addFlashAttribute("result", product.getProductId());
        return "redirect:/store/adminList";
    }

    @GetMapping("/list")
    public void getList(StoreCriteria cri, Model model){
        System.out.println("목록 get");
        System.out.println(cri);
        List<ProductVO> list = service.getList(cri);
        model.addAttribute("list", list);
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new StorePageDTO(cri, total));
    }

    @GetMapping("/category")
    public String getCategory(@RequestParam("type") String type, StoreCriteria cri, Model model){
        cri.setType(type);
        List<ProductVO> list = service.getCategory(cri);
        model.addAttribute("list", list);
        int total = service.getTypeTotal(type);
        model.addAttribute("pageMaker", new StorePageDTO(cri, total));
        model.addAttribute("type", type);
        return "/store/list";
    }

    @GetMapping({"/get", "/modify"})
    public void getGet(@RequestParam("productId") int productId,
                       @ModelAttribute("cri") StoreCriteria cri, Model model){
        System.out.println("조회 get, 수정 get");
        model.addAttribute("product", service.get(productId));
        model.addAttribute("attachList", service.getAttachList(productId));
    }

    @PostMapping("/modify")
    public String postModify(ProductVO product,
                             @ModelAttribute("cri") StoreCriteria cri,
                             RedirectAttributes rttr){
        System.out.println("수정 post");
        service.modify(product);
        rttr.addFlashAttribute("updateRes", product.getProductId());
        return "redirect:/store/adminList" + cri.getListLink();
    }

    @PostMapping("/remove")
    public String postRemove(@RequestParam("productId") int productId,
                             @ModelAttribute("cri") StoreCriteria cri,
                             RedirectAttributes rttr){
        System.out.println("삭제 post");
        List<ProductAttachVO> attachList = service.getAttachList(productId);
        if(service.remove(productId)) {
            deleteFiles(attachList);
            rttr.addFlashAttribute("removeRes", productId);
        }
        return "redirect:/store/adminList" + cri.getListLink();
    }

    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<ProductAttachVO>> getAttachList(int productId){
        System.out.println("첨부파일 리스트 get");
        return new ResponseEntity<>(service.getAttachList(productId), HttpStatus.OK);
    }

    @GetMapping(value = "/getProduct", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ProductVO> getProduct(int productId){
        System.out.println("상품 one get");
        return new ResponseEntity(service.get(productId), HttpStatus.OK);
    }

    private void deleteFiles(List<ProductAttachVO> attachList) {
        if(attachList == null || attachList.size() == 0){
            return;
        }
        System.out.println("delete attach files!!");
        System.out.println(attachList);

        attachList.forEach(attach -> {
            try {
                Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
                Files.deleteIfExists(file);
                Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
                Files.delete(thumbNail);
            } catch (Exception e) {
                log.error("delete file error"+e.getMessage());
            }
        });
    }

    //관리자 화면 get
    @GetMapping("/admin")
    public void adminGet() {
        System.out.println("관리자 화면 get");
    }

    @GetMapping("/adminList")
    public void adminList(StoreCriteria cri, Model model) {
        System.out.println("관리자 상품 목록 화면 get");
        model.addAttribute("list", service.getList(cri));
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new StorePageDTO(cri, total));
    }

    @GetMapping("/adminGet")
    public void adminGet(@RequestParam("productId") int productId,
                         @ModelAttribute("cri") StoreCriteria cri, Model model) {
        System.out.println("관리자 상품 조회 화면 get");
        model.addAttribute("product", service.get(productId));
        model.addAttribute("attachList", service.getAttachList(productId));
    }

    //카트에 담기
    private static final Gson gson = new Gson();

    @GetMapping(value = "/addCart", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> addCart(HttpSession session, @RequestParam("productId") int productId,
                          @RequestParam("count") int count) {
        System.out.println("카트에 담기 get");
        UserVO user = (UserVO)session.getAttribute("userVO");
        String userId = user.getUserId();

        CartVO cart = new CartVO();
        cart.setUserId(userId);
        cart.setCount(count);
        cart.setProductId(productId);

        service.addCart(cart);
        return ResponseEntity.ok(gson.toJson("success"));
    }


    //주문 - 카트에서
    @GetMapping("/orderForm")
    public void orderForm(@RequestParam("productId") List<Integer> productIds, Model model) {
        System.out.println("주문하기 get");
        List<OrderOneProcVO> list = new ArrayList<>();
        for(int productId: productIds){
            list.add(service.getOneProc(productId));
            System.out.println(service.getOneProc(productId));
        }
        model.addAttribute("list", list);
    }

    //주문 - 상품 조회에서 바로
    @GetMapping("/orderStraight")
    public String orderStraight(@RequestParam("productId") int productId,
                              @RequestParam("count") int count, Model model) {
        List<OrderOneProcVO> list = new ArrayList<>();
        list.add(service.getOneStraight(productId, count));
        model.addAttribute("list", list);
        return "/store/orderForm";
    }

    @PostMapping("/orderForm")
    public String orderFormPost(HttpSession session, OrderVO order, Model model,
                                @RequestParam("productId") List<Integer> productIds,
                                @RequestParam("count") List<Integer> counts) {
        System.out.println("주문하기 post");

        UserVO user = (UserVO)session.getAttribute("userVO");
        String userId = user.getUserId();

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for (int i = 0; i < 6; i++) {
            subNum += (int)(Math.random() * 10);
        }

        String orderId = ymd + "_" + subNum;

        order.setOrderId(orderId);
        order.setUserId(userId);

        System.out.println("productIds: "+productIds);

        // 반복되어 출력되는 productId 값을 하나로 출력
        ArrayList<OrderDetailVO> list = new ArrayList<>();
        for (int i = 0; i < productIds.size(); i++){
            OrderDetailVO orderDetail = new OrderDetailVO();
            orderDetail.setProductId(productIds.get(i));
            orderDetail.setCount(counts.get(i));
            list.add(orderDetail);
        }
        System.out.println("성공 시 list: "+list);

        model.addAttribute("orderDetail",list);

        // 결제 API 구현
        session.setAttribute("order",order);

        System.out.println("order: "+order);
        model.addAttribute("order",order);
        model.addAttribute("user",user);
        return "/store/iamport";
    }

    //주문 목록
    @GetMapping("/adminOrderList")
    public void orderListGet(StoreCriteria cri, Model model) {
        System.out.println("관리자 주문 목록");
        List<OrderVO> orderList = service.getOrderList();
        model.addAttribute("orderList", orderList);
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new StorePageDTO(cri, total));
    }

    //주문 상세 목록
    @GetMapping("/adminOrderView")
    public void orderViewGet(@RequestParam("orderId") String orderId,
                             @ModelAttribute("cri") StoreCriteria cri, Model model) {
        System.out.println("관리자 주문 상세 목록 Get");
        List<OrderViewVO> orderView = service.getOrderView(orderId);
        model.addAttribute("orderView", orderView);
    }

    //주문 상세 목록 - 배송상태 변경
    @PostMapping("/adminOrderView")
    public String delivery(OrderVO order) {
        System.out.println("관리자 주문 상세 목록 Post");
        service.modifyDelivery(order);

        if(Objects.equals(order.getDelivery(), "배송중")){
            service.changeStockSub(order.getOrderId()).forEach(i -> {
                ProductVO product = new ProductVO();
                product.setProductId(i.getProductId());
                product.setStock(i.getCount());
                service.changeStock(product);
            });
        }

        return "redirect:/store/adminOrderView?orderId="+order.getOrderId();
    }
    @GetMapping("/orderSuccess")
    public String orderSuccess(HttpServletRequest request, Model model, OrderDetailVO orderDetail,
                               @RequestParam("productId") List<Integer> productIds,
                               @RequestParam("count") List<Integer> counts){
        System.out.println("결제성공 들어오나?");
        // session으로 order정보 가져옴
        HttpSession session = request.getSession();
        OrderVO orderVO = (OrderVO) session.getAttribute("order");

        //결제 성공시 주문 들어감
        service.orderInfo(orderVO);
        String orderId = orderVO.getOrderId();
        String userId = orderVO.getUserId();
        System.out.println("성공시 orderVO 정보 "+orderVO);

        for (int i = 0; i < productIds.size(); i++) {
            //주문 상세 정보 등록
            orderDetail.setOrderId(orderId);
            orderDetail.setProductId(productIds.get(i));
            orderDetail.setCount(counts.get(i));
            service.orderDetailInfo(orderDetail);

            //장바구니 삭제
            service.deleteCart(userId, productIds.get(i));
        }

        List<OrderViewVO> orderView = service.getOrderView(orderId);
        System.out.println(orderView);
        model.addAttribute("orderV",orderView);
        model.addAttribute("order", orderVO);
        return "/store/orderSuccess";
    }
}
