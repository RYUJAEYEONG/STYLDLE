package com.styldle.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
@ToString
public class SnsCriteria {
    private int pageNum;
    private int amount;

    private int startNum;

    public SnsCriteria() {
        this(1, 12);
    }

    public SnsCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.amount);
        return builder.toUriString();
    }
}
