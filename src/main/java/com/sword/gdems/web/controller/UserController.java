package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.NotFoundException;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.OrganizationService;
import com.sword.gdems.web.service.RoleService;
import com.sword.gdems.web.service.UserService;
import org.apache.log4j.LogManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
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
@RequestMapping("/user")
public class UserController {

    private Logger logger = LogManager.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationService organizationService;


    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView(HttpServletRequest request) {
        return "user/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @ModelAttribute DatatableCondition datatableCondition, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
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
    public Object add(@Valid @RequestBody User user, @RequestParam(name = "roleId",required = false) String roleId, HttpServletRequest request) throws Exception {

        checkUserAddParam(user);
        if (userService.exist(user.getLoginName())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "该用户已经存在。");
        }

        User sessionUser = RequestUtil.getLoginUserFromSession(request);
        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonValue(user, sessionUser);

        user.setName(user.getLoginName());

        boolean rst = false;
        if (StringUtils.isEmpty(roleId)) {
            rst = userService.save(user);
        }else {
            rst = userService.save(user,roleId);
        }


        if (!rst) {
            throw new InvalidRequestException(HttpStatus.INTERNAL_SERVER_ERROR + "", "添加失败，请稍后再试。");
        }
        return new JsonResponse<Object>(HttpStatus.CREATED + "", "添加用户成功");
    }

    private void checkUserAddParam(User user) throws InvalidRequestException {

        if (StringUtils.isEmpty(user.getLoginName())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户名必须填写。");
        }

        if (StringUtils.isEmpty(user.getEmail())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户邮箱必须填写。");
        }

        if (StringUtils.isEmpty(user.getPassword())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户密麻必须填写。");
        }

    }


    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public boolean exist(@RequestParam(name = "loginName", required = false) String loginName) throws Exception {

        //当为false时JQuery验证不用过
        if (StringUtils.isEmpty(loginName)) {
            return false;
        }

        //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
        boolean result = userService.exist(loginName);

        return !result;
    }



    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@RequestParam("id") String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "删除ID不能是空值。");
        }

        if (!userService.deleteById(id)) {
            throw new InvalidRequestException(HttpStatus.INTERNAL_SERVER_ERROR + "", "删除失败，请联系管理员。");
        }

        return new JsonResponse<Object>(HttpStatus.OK + "","删除成功。");
    }



    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editView(@RequestParam("id") String id,HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求id是空值。");
        }

        User user = userService.getUserById(id);
        if (user == null) {
            throw new NotFoundException(HttpStatus.NOT_FOUND + "", "该用户不存在啊");
        }


        Organization department = organizationService.getById(user.getDepartmentId());
        Organization major = organizationService.getById(user.getMajorId());
        List<Organization> majors = organizationService.getByParentId(department.getId());

        if (department != null) {
            logger.debug("edit user department:" + department.toString());
            request.setAttribute("department", department);
        }
        if (major != null) {

            logger.debug("edit user major:" + major.toString());
            request.setAttribute("major",major);
        }


        request.setAttribute("majors",majors);

        List<Role> roles = roleService.getByUserId(user.getId());

        if (roles != null && roles.size() > 0) {
            request.setAttribute("cRole", roles.get(0));
        }

        request.setAttribute("user", user);
        return "user/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@Valid @RequestBody User user, @RequestParam(name = "roleId",required = false) String roleId, HttpServletRequest request) throws Exception {

        checkUserUpdateParam(user);

        User sessionUser = RequestUtil.getLoginUserFromSession(request);
        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonUpdateValue(user, sessionUser);

        user.setName(user.getLoginName());

        User userFromDB = userService.getUserById(user.getId());

        if (userFromDB == null) {
            throw new NotFoundException(HttpStatus.NOT_FOUND + "", "需要更新的用户找不到");
        }

        userFromDB.setEmail(user.getEmail());
        userFromDB.setMobile(user.getMobile());
        if (!StringUtils.isEmpty(user.getDepartmentId()) && organizationService.getById(user.getDepartmentId()) != null) {
            userFromDB.setDepartmentId(user.getDepartmentId());
        }

        if (!StringUtils.isEmpty(user.getMajorId()) && organizationService.getById(user.getMajorId()) != null) {
            userFromDB.setMajorId(user.getMajorId());
        }

        boolean rst = userService.updateUser(userFromDB,roleId);

        if (!rst) {
            throw new InvalidRequestException(HttpStatus.INTERNAL_SERVER_ERROR + "", "添加失败，请稍后再试。");
        }
        return new JsonResponse<Object>(HttpStatus.CREATED + "", "添加用户成功");
    }


    private void checkUserUpdateParam(User user) throws InvalidRequestException {

        if (StringUtils.isEmpty(user.getId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户ID必须填写。");
        }


        if (StringUtils.isEmpty(user.getLoginName())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户名必须填写。");
        }

        if (StringUtils.isEmpty(user.getEmail())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "用户邮箱必须填写。");
        }

    }


}
