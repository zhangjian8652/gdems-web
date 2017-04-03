package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.BaseEntity;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.RoleService;
import com.sword.gdems.web.service.UserService;
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
import java.util.Date;
import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    private Logger logger = LogManager.getLogger(RoleController.class);

    @Autowired
    private RoleService roleService;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView(HttpServletRequest request) {
        return "role/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @Valid @ModelAttribute DatatableCondition datatableCondition, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        String searchValue = request.getParameter("search[value]");

        request.setAttribute("searchValue", searchValue);

        request.setAttribute("draw", datatableCondition.getDraw());
        request.setAttribute("offset", datatableCondition.getStart());
        request.setAttribute("limit", datatableCondition.getLength());

        return "role/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "role/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @ModelAttribute("form") Role role, BindingResult result,HttpServletRequest request) throws InvalidRequestException {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Role add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        EntityUtil.setCommonValue(role, user);

        boolean rst = roleService.save(role);

        if (!rst) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.INTERNAL_ERROR));
        }

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, ErrorCodeConfig.getMessage(ErrorCodeConfig.SUCCESS));
    }

    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public boolean exist(@RequestParam(name = "name", required = false) String name) throws Exception {

        //当为false时JQuery验证不用过
        if (StringUtils.isEmpty(name)) {
            return false;
        }

        //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
        boolean result = roleService.exist(name);

        return !result;
    }


}
