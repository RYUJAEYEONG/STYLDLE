package com.styldle.mapper;

import com.styldle.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    //카트 담기
    public void addCart(CartVO cartVO);

    //주문 정보
    public void orderInfo(OrderVO order);

    //주문 상세 정보
    public void orderDetailInfo(OrderDetailVO orderDetail);

    public OrderOneProcVO selectOneProc(int productId);
    public OrderOneProcVO selectOneStraight(@Param("productId") int productId, @Param("count") int count);

    //주문 완료된 상품 카트에서 삭제
    public boolean deleteCart(@Param("userId") String userId, @Param("productId") int productId);

    //주문 목록
    public List<OrderVO> selectOrderList();

    //주문 상세 목록
    public List<OrderViewVO> selectOrderView(String orderId);

    //배송 상태
    public void updateDelivery(OrderVO order);

    //상품 수량 조절
    public void changeStock(ProductVO product);

    //상품 수량 조절 보조
    public List<OrderDetailVO> changeStockSub(String orderId);
}
