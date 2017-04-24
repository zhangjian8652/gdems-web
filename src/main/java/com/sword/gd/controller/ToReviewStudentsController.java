package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.SubjectStudent;
import com.sword.gd.service.SubjectStudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by Joker on 2017/4/21.
 */
@Controller
@RequestMapping("/gd/toreviewstudents")
public class ToReviewStudentsController {

    @Autowired
    private SubjectStudentsService subjectStudentsService;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String listView() {
        return "to-review-students/list";
    }


    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public String list(@Valid @ModelAttribute DatatableCondition condition, BindingResult bindingResult, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求数据不正确");
        }


        User user = RequestUtil.getLoginUserFromSession(request);
        DataTablePage<SubjectStudent> page = subjectStudentsService.getAllStudentsInfoPage(condition);

        request.setAttribute("page",page);

        return "to-review-students/data/list";
    }

}
