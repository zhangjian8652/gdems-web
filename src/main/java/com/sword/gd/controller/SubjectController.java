package com.sword.gd.controller;

import com.sword.admin.entity.Role;
import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.RoleService;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.Subject;
import com.sword.gd.entity.SubjectConfig;
import com.sword.gd.service.ConfigService;
import com.sword.gd.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Joker on 2017/4/15.
 */
@Controller
@RequestMapping(value = "/gd/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private ConfigService configService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/verify/list", method = RequestMethod.GET)
    public String verifyListView() {
        return "subject/verify-list";
    }

    @RequestMapping(value = "/verify/list", method = RequestMethod.POST)
    public String verifyListData(@Valid @ModelAttribute DatatableCondition datatableCondition, BindingResult bindingResult, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", bindingResult.getAllErrors().get(0).getDefaultMessage());
        }

        DataTablePage<Subject> pageData = subjectService.verifyPageData(datatableCondition);
        request.setAttribute("page", pageData);

        return "subject/data/verify-list";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView() {
        return "subject/list";
    }


    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(@Valid @ModelAttribute DatatableCondition datatableCondition, BindingResult bindingResult, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", bindingResult.getAllErrors().get(0).getDefaultMessage());
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        DataTablePage<Subject> pageData = null;
        if (user.isAdmin()) {
            pageData = subjectService.pageData(datatableCondition);
        } else{
            pageData = subjectService.pageDirectorSubjects(datatableCondition, user.getId());
        }
        request.setAttribute("page", pageData);

        return "subject/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) throws Exception {

        User user = RequestUtil.getLoginUserFromSession(request);
        List<Role> roles = roleService.getByUserId(user.getId());

        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }

        if(isDirector)
        request.setAttribute("isDirector", isDirector);
        if(isStudent)
        request.setAttribute("isStudent", isStudent);

        return "subject/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @ModelAttribute Subject subject, BindingResult result, HttpServletRequest request) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", result.getAllErrors().get(0).getDefaultMessage());
        }

        User user = RequestUtil.getLoginUserFromSession(request);
        EntityUtil.setCommonValue(subject, user);

        List<Role> roles = roleService.getByUserId(user.getId());

        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }

        if ("学生自选".equals(subject.getSourceFrom())) {
            if (isDirector) {
                throw new SwordException(HttpStatus.BAD_REQUEST + "", "您是导师，不能选择学生自拟。");
            }
            subject.setChooseBy(user.getId());
            subject.setChooseDate(new Date());
            subject.setChooseStatus(Subject.ChooseStatus.CHOOSE);
        } else if(isDirector) {
            if (isStudent) {
                throw new SwordException(HttpStatus.BAD_REQUEST + "", "您是学生，只能选择学生自拟。");
            }
            subject.setChooseStatus(Subject.ChooseStatus.NONE_CHOOSE);
            subject.setDirector(user.getId());
        }


        if (isDirector) {
            SubjectConfig subjectConfig = configService.getSubjectConfig();
            int count = subjectService.getCreateAvailableCountByUserId(user.getId());

            if (count >= subjectConfig.getStudentNum()) {
                throw new SwordException(HttpStatus.BAD_REQUEST + "", "您提交的选题数量已经上线，不能超过" + count);
            }
        }

        if (isStudent) {
            int count = subjectService.getCreateAvailableCountByUserId(user.getId());
            if (count > 0) {
                throw new SwordException(HttpStatus.BAD_REQUEST + "", "您提交的选题数量已经上线，不能超过" + count);
            }
        }


        subject.setStatus(Subject.Status.CREATED);

        boolean rst = subjectService.add(subject);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "系统错误，添加失败。");
        }
        return new JsonResponse<Subject>(HttpStatus.CREATED + "", "添加成功");
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editView(@RequestParam String id, HttpServletRequest request) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "编辑选题ID为空值");
        }

        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new InvalidRequestException(HttpStatus.NOT_FOUND + "", "该选题找不到");
        }

        User user = RequestUtil.getLoginUserFromSession(request);
        List<Role> roles = roleService.getByUserId(user.getId());

        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }

        request.setAttribute("isDirector", isDirector);
        request.setAttribute("isStudent", isStudent);

        request.setAttribute("subject", subject);
        return "subject/edit";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@Valid @ModelAttribute Subject subject, BindingResult result, HttpServletRequest request) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", result.getAllErrors().get(0).getDefaultMessage());
        }

        User user = RequestUtil.getLoginUserFromSession(request);
        EntityUtil.setCommonValue(subject, user);

        Subject subjectFromDB = subjectService.getById(subject.getId());

        //标题不允许修改了
        //subjectFromDB.setTittle(subject.getTittle());
        subjectFromDB.setFromDate(subject.getFromDate());
        subjectFromDB.setEndDate(subject.getEndDate());
        subjectFromDB.setGraduationDate(subject.getGraduationDate());
        subjectFromDB.setType(subject.getType());
        subjectFromDB.setSourceFrom(subject.getSourceFrom());
        subjectFromDB.setRequirement(subject.getRequirement());
        subjectFromDB.setMainTask(subject.getMainTask());

        EntityUtil.setCommonUpdateValue(subject, user);


        boolean rst = subjectService.update(subjectFromDB);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "系统错误，更新失败。");
        }
        return new JsonResponse<Subject>(HttpStatus.CREATED + "", "更新成功。");
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@RequestParam String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            return false;
        }

        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new InvalidRequestException(HttpStatus.NOT_FOUND + "", "该选题已经不存在");
        }

        if (Subject.ChooseStatus.APPROVED.equalsIgnoreCase(subject.getChooseStatus())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "选题已经通过审批，不能删除。");
        }

        boolean rst = subjectService.delete(subject.getId());

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "删除失败，请联系管理员");
        }

        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "删除选题成功");
    }

    @RequestMapping(value = "/available", method = RequestMethod.GET)
    public String available(HttpServletRequest request) throws Exception {


        List<Subject> subjects = subjectService.getAvailable();

        request.setAttribute("subjects", subjects);
        return "subject/available";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(HttpServletRequest request, @RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID不能为空值。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }
        request.setAttribute("subject", subject);

        return "subject/detail";
    }

    @RequestMapping(value = "/choose/detail", method = RequestMethod.GET)
    public String choosedetail(HttpServletRequest request) throws Exception {


        User user = RequestUtil.getLoginUserFromSession(request);
        Subject subject = subjectService.getByChooseUserId(user.getId());

        if (subject != null) {
            request.setAttribute("subject", subject);
        }

        return "subject/choose-detail";
    }


    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verifyView(HttpServletRequest request, @RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID不能为空值。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }

        List<Role> roles = roleService.getByUserId(subject.getCreateBy());
        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }
        request.setAttribute("isDirector", isDirector);
        request.setAttribute("isStudent", isStudent);

        List<User> directors = userService.getUserByRoleName("导师");


        List<User> availableDirectors = new ArrayList<User>();

        SubjectConfig subjectConfig = configService.getSubjectConfig();
        for (int i = 0; i < directors.size(); i++) {
            User user =  directors.get(i);
            int count = subjectService.getCreateAvailableCountByUserId(user.getId());
            if (count < subjectConfig.getStudentNum()) {
                availableDirectors.add(user);

            }
        }

        request.setAttribute("subject", subject);
        request.setAttribute("directors", availableDirectors);

        return "subject/verify";
    }


    @RequestMapping(value = "/verify", method = RequestMethod.POST)
    @ResponseBody
    public Object verify(HttpServletRequest request, @RequestParam String id, @RequestParam String status, @RequestParam(required = false) String director) throws Exception {


        if (StringUtils.isEmpty(id) || StringUtils.isEmpty(status)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID和status不能为空值。");
        }

        if (!(Subject.Status.APPROVED.equalsIgnoreCase(status) || Subject.Status.DENIED.equalsIgnoreCase(status))) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "审核状态只能为通过或者不通过。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        EntityUtil.setCommonUpdateValue(subject, user);


        subject.setStatus(status);
        subject.setVerifyBy(user.getId());
        subject.setVerifyDate(new Date());


        List<Role> roles = roleService.getByUserId(subject.getCreateBy());
        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }

        if (isDirector) {
            subject.setDirector(subject.getCreateBy());
        }else if(isStudent){
            if (StringUtils.isEmpty(director)) {
                throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "知道老师未指定。");
            }
            subject.setDirector(director);
        }

        boolean rst = subjectService.update(subject);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "审核选题失败，请联系管理员");
        }

        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "审核选题成功");
    }


    @RequestMapping(value = "/choose", method = RequestMethod.GET)
    public String chooseView(HttpServletRequest request, @RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID不能为空值。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }
        request.setAttribute("subject", subject);

        return "subject/choose";
    }


    @RequestMapping(value = "/choose", method = RequestMethod.POST)
    @ResponseBody
    public Object choose(HttpServletRequest request, @RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID和status不能为空值。");
        }

        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }


        User user = RequestUtil.getLoginUserFromSession(request);

        Subject chooseSubject = subjectService.getByChooseUserId(user.getId());

        if (chooseSubject != null && !Subject.ChooseStatus.APPROVED.equalsIgnoreCase(chooseSubject.getChooseStatus())) {

            EntityUtil.setCommonUpdateValue(chooseSubject, user);
            chooseSubject.setChooseStatus(Subject.ChooseStatus.NONE_CHOOSE);
            chooseSubject.setChooseDate(null);
            chooseSubject.setChooseBy(null);
            chooseSubject.setDirector(null);
        }

        if (chooseSubject != null && Subject.ChooseStatus.APPROVED.equalsIgnoreCase(chooseSubject.getChooseStatus())) {
            throw new SwordException(HttpStatus.BAD_REQUEST + "", "您的选题已经通过批准，不能更换了了。");
        }


        EntityUtil.setCommonUpdateValue(subject, user);
        subject.setChooseBy(user.getId());
        subject.setChooseDate(new Date());
        subject.setChooseStatus(Subject.ChooseStatus.CHOOSE);


        List<Role> roles = roleService.getByUserId(subject.getCreateBy());
        boolean isDirector = false;
        boolean isStudent = false;

        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            if ("导师".equals(role.getName())) {
                isDirector = true;
            }
            if ("学生".equals(role.getName())) {
                isStudent = true;
            }

        }

        if (isDirector) {
            subject.setDirector(subject.getCreateBy());
        }


        boolean rst = subjectService.chooseSubject(subject, chooseSubject);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "选择选题失败，请联系管理员");
        }

        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "选择选题成功");
    }


    @RequestMapping(value = "/exist", method = RequestMethod.GET)
    @ResponseBody
    public boolean exist(@RequestParam String tittle) throws Exception {

        if (StringUtils.isEmpty(tittle)) {
            return false;
        }

        List<Subject> subjects = subjectService.getByTittle(tittle);

        return subjects == null || subjects.size() <= 0;
    }


    @RequestMapping(value = "/choose/verify", method = RequestMethod.GET)
    public String chooseVerifyView(HttpServletRequest request, @RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID不能为空值。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }

        request.setAttribute("subject", subject);

        return "subject/choose-verify";
    }


    @RequestMapping(value = "/choose/verify", method = RequestMethod.POST)
    @ResponseBody
    public Object chooseVerify(HttpServletRequest request, @RequestParam String id, @RequestParam String chooseStatus) throws Exception {


        if (StringUtils.isEmpty(id) || StringUtils.isEmpty(chooseStatus)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID和status不能为空值。");
        }

        if (!(Subject.ChooseStatus.APPROVED.equalsIgnoreCase(chooseStatus) || Subject.ChooseStatus.DENIED.equalsIgnoreCase(chooseStatus) || Subject.ChooseStatus.NONE_CHOOSE.equalsIgnoreCase(chooseStatus))) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "选题选择审核状态只能为通过或者不通过，撤销该选择。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw new SwordException(HttpStatus.NOT_FOUND + "", "找不到该选题");
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        EntityUtil.setCommonUpdateValue(subject, user);
        subject.setChooseStatus(chooseStatus);

        boolean rst = subjectService.update(subject);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "选题选择审核失败，请联系管理员");
        }

        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "选题选择审核成功");
    }


    @RequestMapping(value = "/config/edit", method = RequestMethod.GET)
    public String configEditView(HttpServletRequest request) throws Exception {

        SubjectConfig subjectConfig = configService.getSubjectConfig();

        request.setAttribute("subjectConfig", subjectConfig);

        return "subject/config/edit";
    }


    @RequestMapping(value = "/config/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object configEdit(@Valid @ModelAttribute SubjectConfig subjectConfig, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "配置格式不正确" + result.getAllErrors().get(0).getDefaultMessage());
        }

        boolean rst = configService.updateSubjectConfig(subjectConfig);

        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "更新配置失败。");
        }
        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "更新配置成功。");
    }


}