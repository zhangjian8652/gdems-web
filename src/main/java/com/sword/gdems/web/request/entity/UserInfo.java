package com.sword.gdems.web.request.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */

public class UserInfo {

    @NotEmpty(message = "100016")
    @Length(min = 4, max = 20,message = "100017")
    private String username;
    @NotEmpty(message = "100015")
    @Length(min = 4,max = 20,message = "100014")
    private String password;

    private String code;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
