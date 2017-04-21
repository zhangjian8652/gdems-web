package com.sword.gd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Joker on 2017/4/21.
 */
@Controller
@RequestMapping("/gd/taskbook")
public class TaskbookController {



    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String listView() {

        return "evaluation/taskbook-list.ftl";
    }

}
