package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.OrganizationService;
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
 * Created by Joker on 2017/4/5.
 */

@Controller
@RequestMapping("/organization")
public class OrganizationController {

    private Logger logger = LogManager.getLogger(MenuController.class);

    @Autowired
    private OrganizationService organizationService;


    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    public String treeView() {
        return "organization/tree";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView() {
        return "organization/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @RequestParam(name = "id", required = false) String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }
        request.setAttribute("id", id);
        return "organization/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "organization/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @ModelAttribute("form") Organization organization, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Organization add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, result.getAllErrors().get(0).getDefaultMessage());

        }
        User user = RequestUtil.getLoginUserFromSession(request);
        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonValue(organization, user);

        //保存组织机构
        if (StringUtils.isEmpty(organization.getParentId())) {
            organization.setParentId(Organization.NON_PARENT);
        }
        boolean rst = organizationService.save(organization);

        if (!rst) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, "添加机构失败，请联系管理员");
        }

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, "添加机构成功");
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String editView(HttpServletRequest request) {
        return "organization/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@Valid @ModelAttribute("form") Organization organization, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Role add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, result.getAllErrors().get(0).getDefaultMessage());

        }
        User user = RequestUtil.getLoginUserFromSession(request);
        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonUpdateValue(organization, user);


        Organization organization1 = organizationService.getById(organization.getId());


        organization1.setName(organization.getName());
        organization1.setSort(organization.getSort());
        organization1.setMaster(organization.getMaster());
        organization1.setType(organization.getType());

        //保存菜单
        boolean rst = organizationService.save(organization);

        if (!rst) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, "更新机构失败，请联系管理员");
        }

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, "更新机构成功");
    }



    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public boolean exist(@ModelAttribute Organization organization) throws Exception {

        boolean result;
        //当为false时JQuery验证不用过
        if (!StringUtils.isEmpty(organization.getName())) {
            Organization organization1 = new Organization();
            organization1.setName(organization1.getName());
            result = organizationService.exist(organization1);
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        return true;
    }

}
