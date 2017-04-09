package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.SwordException;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.OrganizationService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

    @RequestMapping(value = "/checkdList", method = RequestMethod.POST)
    public String checkedListData(HttpServletRequest request, @RequestParam(name = "id", required = false) String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }
        request.setAttribute("id", id);

        User user = RequestUtil.getLoginUserFromSession(request);

        List<Organization> ownOrganizations = organizationService.getByUserId(user.getId());
        return "organization/data/cheked-list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "organization/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @RequestBody Organization organization, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Organization add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, result.getAllErrors().get(0).getDefaultMessage());

        }

        boolean rest = organizationService.exist(organization.getName());

        if (rest) {
            throw new SwordException(ErrorCodeConfig.INTERNAL_ERROR, "组织机构已经存在.");
        }

        //这里没有做区域，暂时写死的
        organization.setAreaId("temp");

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

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailView(HttpServletRequest request) {
        request.setAttribute("id", request.getParameter("id"));
        return "organization/detail";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editView(HttpServletRequest request) {
        request.setAttribute("id", request.getParameter("id"));
        return "organization/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@Valid @RequestBody Organization organization, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Role add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, result.getAllErrors().get(0).getDefaultMessage());

        }

        Organization organization1 = organizationService.getById(organization.getId());


        if (organization1 == null) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, "更新机构失败，该机构不存在。");
        }

        organization1.setName(organization.getName());
        organization1.setSort(organization.getSort());
        organization1.setMaster(organization.getMaster());
        organization1.setType(organization.getType());


        User user = RequestUtil.getLoginUserFromSession(request);
        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonUpdateValue(organization, user);

        //保存菜单
        boolean rst = organizationService.save(organization1);

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
            result = organizationService.exist(organization.getName());
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        return true;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public JsonResponse<Boolean> delete(@ModelAttribute Organization organization) throws Exception {

        Organization dbOrganization = organizationService.getById(organization.getId());

        if (dbOrganization == null) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, "该组织机构不存在");
        }

        organizationService.delete(organization.getId());

        return new JsonResponse<Boolean>(HttpStatus.OK + "","删除组织机构成功");

    }


    @RequestMapping(value = "/selecttree",method = RequestMethod.GET)
    public String selectTree() {
        return "organization/tree-select";
    }


    @RequestMapping(value = "/options",method = RequestMethod.GET)
    public String options(@RequestParam(name = "parentId",required = false) String parentId,HttpServletRequest request) throws Exception {

        List<Organization> organizations;
        if (StringUtils.isEmpty(parentId)) {
            organizations = organizationService.getTop();
        }else {
            organizations = organizationService.getByParentId(parentId);
        }
        request.setAttribute("organizations", organizations);
        return "organization/data/options";
    }

}
