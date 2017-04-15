package com.sword.admin.controller;

import com.sword.admin.entity.Menu;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.service.MenuService;
import com.sword.admin.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Joker on 2017/4/12.
 */
@Controller
public class DashboardController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/dashboard",method = RequestMethod.GET)
    public String dashboardView(HttpServletRequest request) throws Exception {

        User user = RequestUtil.getLoginUserFromSession(request);

        List<Menu> menuList =  menuService.getTopByUserId(user.getId());

        request.setAttribute("topMenus", menuList);
        return "dashboard";
    }
}
