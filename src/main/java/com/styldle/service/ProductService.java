package com.styldle.service;

import com.styldle.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {
    public List<ProductVO> getList(StoreCriteria cri);
    public List<ProductVO> getCategory(StoreCriteria cri);
    public ProductVO get(int productId);
    public void register(ProductVO product);
    public boolean modify(ProductVO product);
    public boolean remove(int productId);

    public int getTotal(StoreCriteria cri);
    public int getTypeTotal(String type);
    public List<ProductAttachVO> getAttachList(int productId);

    //카트 담기
    public void addCart(CartVO cart);

    //주문 정보
    public void orderInfo(OrderVO order);

    //주문 상세 정보
    public void orderDetailInfo(OrderDetailVO orderDetail);

    public OrderOneProcVO getOneProc(int productId);
    public OrderOneProcVO getOneStraight(@Param("productId") int productId, @Param("count") int count);

    //주문 완료 상품 카트에서 삭제
    public boolean deleteCart(@Param("userId") String userId, @Param("productId") int productId);

    //주문 목록(관리자)
    public List<OrderVO> getOrderList();
    public List<OrderViewVO> getOrderView(String orderId);

    public void modifyDelivery(OrderVO order);

    public void changeStock(ProductVO product);
    public List<OrderDetailVO> changeStockSub(String orderId);
}
