package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.request.entity.DatatableCondition;
import org.apache.log4j.LogManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private Logger logger = LogManager.getLogger(UserController.class);

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView(HttpServletRequest request) {
        return "user/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @ModelAttribute DatatableCondition datatableCondition, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR,ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        String searchValue = request.getParameter("search[value]");

        request.setAttribute("searchValue", searchValue);

        request.setAttribute("draw", datatableCondition.getDraw());
        request.setAttribute("offset", datatableCondition.getStart());
        request.setAttribute("limit", datatableCondition.getLength());

        return "user/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "user/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(HttpServletRequest request) {
        return "user/add";
    }


}
