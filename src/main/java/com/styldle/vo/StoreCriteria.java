package com.styldle.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
@ToString
public class StoreCriteria {
    private int page;
    private int perPageNum;
    private String keyword;
    private String type;

    public int getPageStart(){
        return (this.page -1) * perPageNum;
    }

    public StoreCriteria(){
        this(1, 10);
    }

    public StoreCriteria(int page, int perPageNum){
        this.page = page;
        this.perPageNum = perPageNum;
    }

    public String getListLink(){
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("page", this.getPage())
                .queryParam("perPageNum", this.getPerPageNum())
                .queryParam("keyword", this.getKeyword())
                .queryParam("type", this.getType());
        return builder.toUriString();
    }


}
