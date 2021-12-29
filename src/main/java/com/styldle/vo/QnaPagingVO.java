package com.styldle.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaPagingVO {
    private int startPage;// 시작 페이지
    private int endPage;// 끝 페이지
    private boolean prev,next;// 이전 다음 페이지가 있는가?
    private int total; //총 데이터(레코드/행)의 갯수
    private QnaCriteria cri;// 페이지 넘버와 페이지당 갯수
    private int realEnd;

    public QnaPagingVO(QnaCriteria cri , int total) {
        this.cri=cri;
        this.total=total;
        this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
        this.startPage =this.endPage-9;
        this.realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
        if(this.realEnd <this.endPage) this.endPage= this.realEnd;
        this.prev= this.startPage>1;
        this.next= this.endPage<this.realEnd;
        System.out.println("cri "+this.cri+"total "+this.total+"endPage "+this.endPage+"startPage "+this.startPage+"realEnd "+realEnd+"prev "+this.prev+"next "+this.next);
    }
}
