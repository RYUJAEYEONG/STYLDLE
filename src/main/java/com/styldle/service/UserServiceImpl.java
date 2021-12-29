package com.styldle.service;

import com.styldle.mapper.UserMapper;
import com.styldle.vo.*;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;

    //회원가입처리
    @Transactional
    @Override
    public void register(UserVO userVO) {
        userMapper.insert(userVO);
    }

    @Override
    public UserVO login(LoginVO loginVO) {
        return userMapper.login(loginVO);
    }

    @Override
    public boolean updateWin(UserVO userVO) {
        return userMapper.updateWin(userVO) == "";
    }

    @Override
    public boolean updateDraw(UserVO userVO) {
        return userMapper.updateDraw(userVO) == "";
    }

    @Override
    public boolean updateLose(UserVO userVO) {
        return userMapper.updateLose(userVO) == "";
    }

    @Override
    public UserVO get(String userId) {
        return userMapper.get(userId);
    }

    @Override
    public List<CartListVO> cartList(String userId) {
        return userMapper.cartList(userId);
    }

    @Override
    public void deleteCart(CartListVO cartListVO) {
        userMapper.deleteCart(cartListVO);
    }

    @Override
    public void userDelete(LoginVO LoginVO) {
        userMapper.userDelete(LoginVO);
    }

    @Override
    public List<UserVO> list(String userId) {
        return userMapper.list(userId);
    }

    @Override
    public void userBan(UserVO userVO) {
        userMapper.userBan(userVO);
    }

    @Override
    public void update(UserVO userVO) {
        userMapper.update(userVO);
    }

    @Override
    public void pwdUpdate(UserVO userVO) {
        userMapper.pwdUpdate(userVO);
    }

    @Override
    public List<OrderListVO> orderList(String userId) {
        return userMapper.orderList(userId);
    }

    @Override
    public int idCheck(String userId) {
        int result = userMapper.idCheck(userId);
        return result;
    }

    @Override
    public void cartUpdate(CartListVO cartListVO) {
        userMapper.cartUpdate(cartListVO);
    }

    @Override
    public List<UserVO> getList(UserCriteria cri) {
        return userMapper.getListWithPaging(cri);
    }

    @Override
    public int getTotal() {
        return userMapper.getTotalCount();
    }

    @Override
    public CartListVO getCart(int cartId) {
        return userMapper.getCart(cartId);
    }

    @Override
    public void updateCart(CartListVO CartListVO) {
        userMapper.updateCart(CartListVO);
    }

}
