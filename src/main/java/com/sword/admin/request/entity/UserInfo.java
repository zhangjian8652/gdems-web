package com.sword.admin.request.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */

public class UserInfo {

    @NotEmpty(message = "用户名不能为空。")
    @Length(min = 4, max = 20,message = "用户名长度必须为4到20位。")
    private String username;
    @NotEmpty(message = "用密码不能为空")
    @Length(min = 4,max = 20,message = "用户密码必须为4到20位。")
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
