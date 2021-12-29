package com.styldle.mapper;

import com.styldle.vo.*;
import org.springframework.security.core.userdetails.User;

import java.util.List;

public interface UserMapper {
    void insert(UserVO userVO);
    //    UserVO login(UserVO userVO);
    UserVO login(LoginVO LoginVO);
    String updateWin (UserVO userVO);
    String updateDraw (UserVO userVO);
    String updateLose (UserVO userVO);
    UserVO get(String userId);
    List<CartListVO> cartList(String userId);
    List<UserVO> list(String userId);

    void deleteCart(CartListVO cartListVO);
    void userDelete(LoginVO LoginVO);
    void userBan(UserVO userVO);
    void update(UserVO userVO);
    void pwdUpdate(UserVO userVO);
    List<OrderListVO> orderList(String userId);
    int idCheck(String userId) ;
    void cartUpdate(CartListVO cartListVO);

    void updatePoint(UserVO userVO);

    List<UserVO> getListWithPaging(UserCriteria cri);

//    List<CartListVO> getListWithPaging2(UserCriteria cri);

    int getTotalCount();
//    int getTotalCount2();

    CartListVO getCart(int cartId);

    void updateCart(CartListVO CartListVO);
}
