package com.styldle.service;

import com.styldle.vo.QnaBoardVO;
import lombok.Setter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
public class QnaServiceTests {
    @Setter(onMethod_=@Autowired)
    QnaBoardService service;

//    @Test
//    public void getList(){
//        service.getList().forEach(i-> System.out.println(i));
//    }
    @Test
    public void registerTest(){
        QnaBoardVO vo = new QnaBoardVO();
        vo.setUserId("hyj1234");
        vo.setTitle("레지스터 테스트22");
        vo.setContent("등록 본문입니다22");
        service.register(vo);}
}
