package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.config.GlobalConfig;
import com.sword.gdems.web.entity.Page;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTableData;
import com.sword.gdems.web.response.entity.DataTableUser;
import com.sword.gdems.web.service.DataTableService;
import org.apache.log4j.LogManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private DataTableService dataTableService;

    private Logger logger = LogManager.getLogger(UserController.class);

    @RequestMapping(value = "/list/view", method = RequestMethod.GET)
    public String listView(HttpServletRequest request) {
        return "user/list";
    }

    @RequestMapping(value = "/list/data", method = RequestMethod.GET)
    public String listData(HttpServletRequest request, @ModelAttribute DatatableCondition datatableCondition, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR,ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        String searchValue = request.getParameter("search[value]");
        int start = datatableCondition.getStart();
        int length = datatableCondition.getLength();

        request.setAttribute("searchValue", searchValue);
        request.setAttribute("start", start);
        request.setAttribute("length", length);

        return "user/data/list";
    }

}
