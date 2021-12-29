package com.styldle.mapper;

import com.styldle.vo.*;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class UserMapperTests {
    @Setter(onMethod_ = @Autowired)
    private UserMapper userMapper;

//    @Test
//    public void update() {
//        CartListVO vo = new CartListVO();
//        vo.setCartId(1);
//        vo.setCount(2);
//
//
//        userMapper.cartUpdate(vo);
//    }

    @Test
    public void update2() {
        UserVO vo = new UserVO();
        vo.setUserId("aaaa");
        vo.setMail("a");
        userMapper.update(vo);
        System.out.println(vo);
    }

//    insert into cart values(1,"a","1",1);
//    @Test
//    public void insert(){
//        CartVO vo = new CartVO();
//        for(int i=2; i<100; i++) {
//
//            vo.setUserId("a");
//            vo.setProductId(2);
//            vo.setCount(10);
//            userMapper.addCart(vo);
//        }
//    }

}
