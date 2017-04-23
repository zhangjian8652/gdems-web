package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.NotFoundException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.MySubjectStudent;
import com.sword.gd.entity.TaskBook;
import com.sword.gd.service.MySubjectStudentsService;
import com.sword.gd.service.TaskBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Joker on 2017/4/21.
 */
@Controller
@RequestMapping("/gd/taskbook")
public class TaskBooksController {

    @Autowired
    private MySubjectStudentsService myStudentsService;

    @Autowired
    private TaskBookService taskBookService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editView(@RequestParam(name = "id",required = false) String id,HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求数据不正确");
        }

        User user = userService.getUserById(id);

        if (user == null) {
            throw new NotFoundException(HttpStatus.NOT_FOUND + "", "找不到该用户。");
        }

        TaskBook taskBook = taskBookService.getByStudentId(id);
        if (taskBook == null) {
            taskBook = new TaskBook();
        }
        request.setAttribute("taskbood", taskBook);

        MySubjectStudent mySubjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("mySubjectStudent",mySubjectStudent);

        return "my-subject-students/taskbook-edit";
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute("form") TaskBook taskBook, HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(taskBook.getStudentId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求学生id为空值");
        }

        TaskBook taskBookFromDB = taskBookService.getByStudentId(taskBook.getStudentId());

        User user = RequestUtil.getLoginUserFromSession(request);

        if (taskBookFromDB == null) {
            taskBookFromDB = new TaskBook();
            EntityUtil.setCommonValue(taskBookFromDB, user);
        } else {
            EntityUtil.setCommonUpdateValue(taskBookFromDB, user);
        }

        taskBookFromDB.setStudentId(taskBook.getStudentId());
        taskBookFromDB.setThesisTittle(taskBook.getThesisTittle());
        taskBookFromDB.setProfessionalSubject(taskBook.getProfessionalSubject());
        taskBookFromDB.setRequirementContent(taskBook.getRequirementContent());
        taskBookFromDB.setSendDate(taskBook.getSendDate());
        taskBookFromDB.setFinishDate(taskBook.getFinishDate());
        taskBookFromDB.setPracticeUnits(taskBook.getPracticeUnits());
        taskBookFromDB.setPracticeAddress(taskBook.getPracticeAddress());
        taskBookFromDB.setThesisPageCount(taskBook.getThesisPageCount());
        taskBookFromDB.setDrawingPageCount(taskBook.getDrawingPageCount());


        boolean result = false;
        if (StringUtils.isEmpty(taskBookFromDB.getId())) {
            result = taskBookService.add(taskBookFromDB);
        } else {
            result = taskBookService.update(taskBookFromDB);
        }

        if (!result) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "系统错误，请联系管理员");
        }
        return new JsonResponse<Object>(HttpStatus.OK + "", "填写任务书成功。");
    }


    @RequestMapping(value = "/print", method = RequestMethod.GET)
    public String printView(@RequestParam(name = "id",required = false) String id,HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求数据不正确");
        }

        User user = userService.getUserById(id);

        if (user == null) {
            throw new NotFoundException(HttpStatus.NOT_FOUND + "", "找不到该用户。");
        }

        TaskBook taskBook = taskBookService.getByStudentId(id);
        if (taskBook == null) {
            taskBook = new TaskBook();
        }
        request.setAttribute("taskbood", taskBook);

        MySubjectStudent mySubjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("mySubjectStudent",mySubjectStudent);

        return "my-subject-students/taskbook-print";
    }

}
