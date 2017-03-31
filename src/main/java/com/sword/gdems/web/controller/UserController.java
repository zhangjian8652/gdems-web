package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.GlobalConfig;
import com.sword.gdems.web.response.DataTableData;
import com.sword.gdems.web.response.entity.DataTableUser;
import com.sword.gdems.web.service.DataTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/list/view", method = RequestMethod.GET)
    public String listView(HttpServletRequest request) {
        return "user/user-list";
    }

    @RequestMapping(value = "/list/data", method = RequestMethod.GET)
    @ResponseBody
    public DataTableData<DataTableUser> listData(HttpServletRequest request, @RequestParam(name = "offset", required = false) Integer offset, @RequestParam(name = "limit", required = false) Integer limit) throws Exception {


        if (offset == null) {
            offset = GlobalConfig.DEFAULT_PAGE_OFFSET;
        }

        if(limit == null){
            limit = GlobalConfig.DEFAULT_PAGE_LIMIT;
        }


        List<DataTableUser> dataTableUserList = dataTableService.findList(new DataTableUser(), offset, limit);

        DataTableData<DataTableUser> dataTableData = new DataTableData<DataTableUser>(offset + 1, limit, limit, dataTableUserList);

        return dataTableData;
    }

}
