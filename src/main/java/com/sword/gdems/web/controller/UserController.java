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
        return "user/user-list";
    }

    @RequestMapping(value = "/list/data", method = RequestMethod.GET)
    @ResponseBody
    public DataTableData<DataTableUser> listData(HttpServletRequest request, @ModelAttribute DatatableCondition datatableCondition, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR,ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        String searchValue = request.getParameter("search[value]");
        Page<DataTableUser> page;

        //查询table user 分页数据
        logger.debug("UserController listData search value is :" + searchValue);
        page  = dataTableService.findList(searchValue, datatableCondition.getStart(), datatableCondition.getLength());
        //封装返回数据
        DataTableData<DataTableUser> dataTableData = new DataTableData<DataTableUser>(datatableCondition.getDraw(), page.getCount(),  page.getCount(), page.getDatas());

        return dataTableData;
    }

}
