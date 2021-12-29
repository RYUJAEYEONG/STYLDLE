package com.styldle.service;

import com.styldle.mapper.OrderMapper;
import com.styldle.mapper.ProductAttachMapper;
import com.styldle.mapper.ProductMapper;
import com.styldle.vo.*;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {

    @Setter(onMethod_=@Autowired)
    private ProductMapper mapper;

    @Setter(onMethod_=@Autowired)
    private ProductAttachMapper attachMapper;

    @Setter(onMethod_=@Autowired)
    private OrderMapper orderMapper;

    @Override
    public List<ProductVO> getList(StoreCriteria cri) {
        return mapper.selectListWithPaging(cri);
    }

    @Override
    public List<ProductVO> getCategory(StoreCriteria cri) {
        return mapper.selectCategory(cri);
    }

    @Override
    public ProductVO get(int productId) {
        return mapper.select(productId);
    }

    @Transactional
    @Override
    public void register(ProductVO product) {
        System.out.println("등록 service");
        mapper.insertSelectKey(product);

        if(product.getAttachList() == null || product.getAttachList().size() <= 0){
            return;
        }
        product.getAttachList().forEach(attach -> {
            attach.setProductId(product.getProductId());
            attachMapper.insert(attach);
        });
    }

    @Transactional
    @Override
    public boolean modify(ProductVO product) {
        attachMapper.deleteAll(product.getProductId());
        boolean modifyResult = mapper.update(product);
        if(modifyResult && product.getAttachList() != null && product.getAttachList().size() > 0){
            product.getAttachList().forEach(attach -> {
                attach.setProductId(product.getProductId());
                attachMapper.insert(attach);
            });
        }
        return modifyResult;
    }

    @Transactional
    @Override
    public boolean remove(int productId) {
        attachMapper.deleteAll(productId);
        return mapper.delete(productId);
    }

    @Override
    public int getTotal(StoreCriteria cri) {
        return mapper.getTotalCount(cri);
    }

    @Override
    public int getTypeTotal(String type) {
        return mapper.getTypeCount(type);
    }

    @Override
    public List<ProductAttachVO> getAttachList(int productId) {
        return attachMapper.findByProductId(productId);
    }

    @Override
    public void addCart(CartVO cart) {
        orderMapper.addCart(cart);
    }

    @Override
    public void orderInfo(OrderVO order) {
        orderMapper.orderInfo(order);
    }

    @Override
    public void orderDetailInfo(OrderDetailVO orderDetail) {
        orderMapper.orderDetailInfo(orderDetail);
    }

    @Override
    public OrderOneProcVO getOneProc(int productId) {
        return orderMapper.selectOneProc(productId);
    }

    @Override
    public OrderOneProcVO getOneStraight(int productId, int count) {
        return orderMapper.selectOneStraight(productId, count);
    }

    @Override
    public boolean deleteCart(String userId, int productId) {
        return orderMapper.deleteCart(userId, productId);
    }

    @Override
    public List<OrderVO> getOrderList() {
        return orderMapper.selectOrderList();
    }

    @Override
    public List<OrderViewVO> getOrderView(String orderId) {
        return orderMapper.selectOrderView(orderId);
    }

    @Override
    public void modifyDelivery(OrderVO order) {
        orderMapper.updateDelivery(order);
    }

    @Override
    public void changeStock(ProductVO product) {
        orderMapper.changeStock(product);
    }

    @Override
    public List<OrderDetailVO> changeStockSub(String orderId) {
        return orderMapper.changeStockSub(orderId);
    }

}
