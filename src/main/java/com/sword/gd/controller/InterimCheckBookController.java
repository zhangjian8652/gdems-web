package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.NotFoundException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.entity.MySubjectStudent;
import com.sword.gd.entity.TaskBook;
import com.sword.gd.mapper.InterimCheckBookMapper;
import com.sword.gd.service.InterimCheckBookService;
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
@RequestMapping("/gd/interimcheckbook")
public class InterimCheckBookController {

    @Autowired
    private MySubjectStudentsService myStudentsService;

    @Autowired
    private InterimCheckBookService interimCheckBookService;

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

        InterimCheckBook interimCheckBook = interimCheckBookService.getByStudentId(id);
        if (interimCheckBook == null) {
            interimCheckBook = new InterimCheckBook();
        }
        request.setAttribute("interimCheckBook", interimCheckBook);

        MySubjectStudent mySubjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("mySubjectStudent",mySubjectStudent);

        return "my-subject-students/interim-check-book-edit";
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute("form") InterimCheckBook interimCheckBook, HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(interimCheckBook.getStudentId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求学生id为空值");
        }

        InterimCheckBook interimCheckBookFromDB = interimCheckBookService.getByStudentId(interimCheckBook.getStudentId());

        User user = RequestUtil.getLoginUserFromSession(request);

        if (interimCheckBookFromDB == null) {
            interimCheckBookFromDB = new InterimCheckBook();
            EntityUtil.setCommonValue(interimCheckBookFromDB, user);
        } else {
            EntityUtil.setCommonUpdateValue(interimCheckBookFromDB, user);
        }

        interimCheckBookFromDB.setStudentId(interimCheckBook.getStudentId());
        interimCheckBookFromDB.setThesisTittle(interimCheckBook.getThesisTittle());
        interimCheckBookFromDB.setFinish(interimCheckBook.getFinish());
        interimCheckBookFromDB.setConformance(interimCheckBook.getConformance());
        interimCheckBookFromDB.setRequireFinish(interimCheckBook.getRequireFinish());
        interimCheckBookFromDB.setFinishInTime(interimCheckBook.getFinishInTime());
        interimCheckBookFromDB.setProblemsSolutions(interimCheckBook.getProblemsSolutions());


        boolean result = false;
        if (StringUtils.isEmpty(interimCheckBookFromDB.getId())) {
            result = interimCheckBookService.add(interimCheckBookFromDB);
        } else {
            result = interimCheckBookService.update(interimCheckBookFromDB);
        }

        if (!result) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "系统错误，请联系管理员");
        }
        return new JsonResponse<Object>(HttpStatus.OK + "", "填写中期检查表成功。");
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

        InterimCheckBook interimCheckBook = interimCheckBookService.getByStudentId(id);
        if (interimCheckBook == null) {
            interimCheckBook = new InterimCheckBook();
        }
        request.setAttribute("interimCheckBook", interimCheckBook);

        MySubjectStudent mySubjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("mySubjectStudent",mySubjectStudent);

        return "my-subject-students/interim-check-book-print";
    }

}
