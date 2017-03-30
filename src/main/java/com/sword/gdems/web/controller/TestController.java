package com.sword.gdems.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author zhangjian
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
