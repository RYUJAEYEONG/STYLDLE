package com.styldle.mapper;

import com.styldle.vo.QnaBoardVO;
import com.styldle.vo.QnaCriteria;
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
public class QnaBoardMapperTests {
    @Setter(onMethod_=@Autowired)
    QnaBoardMapper mapper;

    @Test
    public void getListTest(){
        mapper.getList().forEach(i-> System.out.println(i));
    }
    @Test
    public void registerTest(){
        for(int i=0; i<100; i++) {
            QnaBoardVO vo = new QnaBoardVO();
            vo.setUserId("hyj1234");
            vo.setTitle("레지스터 테스트"+i);
            vo.setContent("등록 본문입니다"+i);
            mapper.insert(vo);
        }
        }

    @Test
    public void testPaging(){
        QnaCriteria cri = new QnaCriteria();
        List<QnaBoardVO> list = mapper.getListWithPaging(cri);
        list.forEach(board-> System.out.println(board));
    }
    @Test
    public void testSearch(){
        QnaCriteria cri = new QnaCriteria();
        cri.setKeyword("eee");
        cri.setType("TCW");
        System.out.println("cri: " +cri);
        List<QnaBoardVO> list = mapper.getListWithPaging(cri);
        list.forEach(board-> System.out.println(board));
    }
}
