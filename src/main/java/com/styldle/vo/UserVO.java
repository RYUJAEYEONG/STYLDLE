package com.styldle.vo;

import lombok.Data;

@Data
public class UserVO {
    private String userId;
    private String role;
    private String name;
    private String pwd;
    private String birth;
    private String gender;
    private String mail;
    private String phone;
    private String zipCode;
    private String address;
    private int point;
}
