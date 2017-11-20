package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.NotFoundException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.ExaminationCommentBook;
import com.sword.gd.entity.SubjectStudent;
import com.sword.gd.service.ExaminationCommentBookService;
import com.sword.gd.service.SubjectStudentsService;
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
@RequestMapping("/gd/examinationcommentbook")
public class ExaminationCommentBookController {

    @Autowired
    private SubjectStudentsService subjectStudentsService;

    @Autowired
    private ExaminationCommentBookService examinationCommentBookService;

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

        ExaminationCommentBook examinationCommentBook = examinationCommentBookService.getByStudentId(id);
        if (examinationCommentBook == null) {
            examinationCommentBook = new ExaminationCommentBook();
        }


        request.setAttribute("examinationCommentBook", examinationCommentBook);

        if (!StringUtils.isEmpty(examinationCommentBook.getExaminationComment())) {
            String[] comments = examinationCommentBook.getExaminationComment().split(":");
            for (int i = 1; i <= comments.length; i++) {
                request.setAttribute("comment" + i, comments[i - 1]);
            }
        }

        SubjectStudent subjectStudent = subjectStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "subject-students/examination-comment-book-edit";
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute("form") ExaminationCommentBook examinationCommentBook, HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(examinationCommentBook.getStudentId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求学生id为空值");
        }

        ExaminationCommentBook examinationCommentBookFromDB = examinationCommentBookService.getByStudentId(examinationCommentBook.getStudentId());

        User user = RequestUtil.getLoginUserFromSession(request);

        if (examinationCommentBookFromDB == null) {
            examinationCommentBookFromDB = new ExaminationCommentBook();
            EntityUtil.setCommonValue(examinationCommentBookFromDB, user);
        } else {
            EntityUtil.setCommonUpdateValue(examinationCommentBookFromDB, user);
        }

        examinationCommentBookFromDB.setStudentId(examinationCommentBook.getStudentId());
        //TODO 设置字段信息

        StringBuilder comment = new StringBuilder();
        comment.append(request.getParameter("comment1"));
        comment.append(":");
        comment.append(request.getParameter("comment2"));
        comment.append(":");
        comment.append(request.getParameter("comment3"));
        comment.append(":");
        comment.append(request.getParameter("comment4"));
        comment.append(":");
        comment.append(request.getParameter("comment5"));
        comment.append(":");
        comment.append(request.getParameter("comment6"));
        comment.append(":");
        comment.append(request.getParameter("comment7"));
        comment.append(":");
        comment.append(request.getParameter("comment8"));


        examinationCommentBookFromDB.setDesignLevelScore(examinationCommentBook.getDesignLevelScore());
        examinationCommentBookFromDB.setDesignReportScore(examinationCommentBook.getDesignReportScore());
        examinationCommentBookFromDB.setDesignExaminationScore(examinationCommentBook.getDesignExaminationScore());
        examinationCommentBookFromDB.setTotalScore(examinationCommentBook.calculateTotalScore());

        examinationCommentBookFromDB.setExaminationComment(comment.toString());
        examinationCommentBookFromDB.setDirectorTotalScore(examinationCommentBook.getDirectorTotalScore());
        examinationCommentBookFromDB.setExaminationTotalScore(examinationCommentBook.getExaminationTotalScore());
        examinationCommentBookFromDB.setComprehensivePerformanceScore(examinationCommentBook.getComprehensivePerformanceScore());
        examinationCommentBookFromDB.setFiveLevelScore(examinationCommentBook.getFiveLevelScore());


        boolean result = false;
        if (StringUtils.isEmpty(examinationCommentBookFromDB.getId())) {
            result = examinationCommentBookService.add(examinationCommentBookFromDB);
        } else {
            result = examinationCommentBookService.update(examinationCommentBookFromDB);
        }

        if (!result) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "系统错误，请联系管理员");
        }
        return new JsonResponse<Object>(HttpStatus.OK + "", "填写评议书成功。");
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

        ExaminationCommentBook examinationCommentBook = examinationCommentBookService.getByStudentId(id);
        if (examinationCommentBook == null) {
            examinationCommentBook = new ExaminationCommentBook();
        }
        request.setAttribute("examinationCommentBook", examinationCommentBook);

        if (!StringUtils.isEmpty(examinationCommentBook.getExaminationComment())) {
            String[] comments = examinationCommentBook.getExaminationComment().split(":");
            for (int i = 1; i <= comments.length; i++) {
                request.setAttribute("comment" + i, comments[i - 1]);
            }
        }


        SubjectStudent subjectStudent = subjectStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "subject-students/examination-comment-book-print";
    }

}
