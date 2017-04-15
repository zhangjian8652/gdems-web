package com.sword.gd.controller;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.sword.admin.common.directive.DirectiveUtils;
import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.response.JsonResponse;
import com.sword.gd.entity.Subject;
import com.sword.gd.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/verify/list", method = RequestMethod.GET)
    public String verifyListView() {
        return "subject/verify-list";
    }

    @RequestMapping(value = "/verify/list", method = RequestMethod.POST)
    public String verifyListData(@ModelAttribute DatatableCondition datatableCondition, BindingResult bindingResult, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", bindingResult.getAllErrors().get(0).getDefaultMessage());
        }

        DataTablePage<Subject> pageData = subjectService.toVerifypageData(datatableCondition);
        request.setAttribute("page", pageData);

        return "subject/data/verify-list";
    }




    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView() {
        return "subject/list";
    }


    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(@ModelAttribute DatatableCondition datatableCondition, BindingResult bindingResult, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", bindingResult.getAllErrors().get(0).getDefaultMessage());
        }

        DataTablePage<Subject> pageData = subjectService.pageData(datatableCondition);
        request.setAttribute("page", pageData);

        return "subject/data/list";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView() {
        return "subject/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@ModelAttribute Subject subject, BindingResult result, HttpServletRequest request) throws Exception {

        if (result.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", result.getAllErrors().get(0).getDefaultMessage());
        }

        User user = RequestUtil.getLoginUserFromSession(request);
        EntityUtil.setCommonValue(subject, user);

        if ("学生自选".equals(subject.getSourceFrom())) {
            subject.setChooseBy(user.getId());
            subject.setChooseDate(new Date());
            subject.setChooseStatus(Subject.ChooseStatus.CHOOSE);
        } else {
            subject.setChooseStatus(Subject.ChooseStatus.NONE_CHOOSE);
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

        request.setAttribute("subject", subject);
        return "subject/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute Subject subject, BindingResult result, HttpServletRequest request) throws Exception {

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

        boolean rst =  subjectService.delete(subject.getId());

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
    public String detail(HttpServletRequest request,@RequestParam String id) throws Exception {


        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "ID不能为空值。");
        }


        Subject subject = subjectService.getById(id);

        if (subject == null) {
            throw  new SwordException(HttpStatus.NOT_FOUND+"","找不到该选题");
        }
        request.setAttribute("subject", subject);

        return "subject/detail";
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

}