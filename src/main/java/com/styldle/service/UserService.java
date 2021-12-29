package com.styldle.service;

import com.styldle.vo.*;
import org.springframework.security.core.userdetails.User;

import java.util.List;


public interface UserService {

    //회원가입처리
    void register(UserVO userVO);

    UserVO login(LoginVO loginVO);

    boolean updateWin(UserVO userVO);

    boolean updateDraw(UserVO userVO);

    boolean updateLose(UserVO userVO);

    UserVO get(String userId);

    List<CartListVO> cartList(String userId);

    void deleteCart(CartListVO cartListVO);

    void userDelete(LoginVO LoginVO);

    List<UserVO> list(String userId);

    void userBan(UserVO userVO);

    void update(UserVO userVO);

    void pwdUpdate(UserVO userVO);

    List<OrderListVO> orderList(String userId);

    int idCheck(String userId);

    void cartUpdate(CartListVO cartListVO);

    List<UserVO> getList(UserCriteria cri);

    int getTotal();

    CartListVO getCart(int cartId);

    void updateCart(CartListVO CartListVO);
}
