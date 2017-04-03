package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.MenuService;
import com.sword.gdems.web.service.RoleService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    private Logger logger = LogManager.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView() {
        return "menu/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @RequestParam(name = "id", required = false) String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }
        request.setAttribute("id", id);
        return "menu/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "menu/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @ModelAttribute("form") Menu menu, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Role add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonValue(menu, user);

        //保存菜单
        boolean rst = menuService.save(menu);

        if (!rst) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.INTERNAL_ERROR));
        }

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, ErrorCodeConfig.getMessage(ErrorCodeConfig.SUCCESS));
    }

    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public boolean exist(@ModelAttribute Menu menu) throws Exception {

        boolean result;
        //当为false时JQuery验证不用过
        if (!StringUtils.isEmpty(menu.getName())) {
            Menu menu1 = new Menu();
            menu1.setName(menu.getName());
            result = menuService.exist(menu1);
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        if (!StringUtils.isEmpty(menu.getPermission())) {
            Menu menu1 = new Menu();
            menu1.setPermission(menu.getPermission());
            result = menuService.exist(menu1);
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        return true;
    }


}
