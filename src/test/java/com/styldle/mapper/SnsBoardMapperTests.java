package com.styldle.mapper;

import com.styldle.vo.SnsCriteria;
import com.styldle.vo.SnsBoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:web/WEB-INF/applicationContext.xml")
@Log4j
public class SnsBoardMapperTests {
    @Setter(onMethod_ = @Autowired)
    private SnsBoardMapper mapper;

    @Test
    public void test() {
        mapper.getList().forEach(i-> System.out.println(i));
    }

    @Test
    public void insert() {
        for(int i = 0; i < 100; i++) {
            SnsBoardVO vo = new SnsBoardVO()
                    .setUserId("hyj1234")
                    .setContent("내용" + i);
            mapper.insert(vo);
        }
    }

//    @Test
    public void getOne() {
        System.out.println(mapper.getOne(2));
    }

//    @Test
    public void update() {
        SnsBoardVO vo = mapper.getOne(2);
        vo.setContent("수정된 내용입니다.");
        mapper.update(vo);

    }

//    @Test
    public void insertSelectKey() {
        SnsBoardVO vo = new SnsBoardVO()
                .setContent("테스트 글")
                .setUserId("jihye");
        mapper.insert(vo);
        System.out.println(vo);
    }

    @Test
    public void paging() {
        SnsCriteria cri = new SnsCriteria();
        cri.setPageNum(3);
        cri.setAmount(10);
        List<SnsBoardVO> list = mapper.getListWithPaging(cri);
        list.forEach(i-> System.out.println(i));
    }

    @Test
    public void getTotalCount() {
        System.out.println(mapper.getTotalCount());
    }

}
