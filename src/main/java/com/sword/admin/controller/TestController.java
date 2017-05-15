package com.sword.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author zhengzhe
 * @Date 2017/3/16
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/freemarker")
    public String freemarker(){
        return "freemarker";
    }


    @RequestMapping("/jsp")
    public String jsp(){
        return "jsp";
    }
}
