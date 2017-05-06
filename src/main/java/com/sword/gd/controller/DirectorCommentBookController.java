package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.NotFoundException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.DirectorCommentBook;
import com.sword.gd.entity.SubjectStudent;
import com.sword.gd.service.DirectorCommentBookService;
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
@RequestMapping("/gd/directorcommentbook")
public class DirectorCommentBookController {

    @Autowired
    private SubjectStudentsService myStudentsService;

    @Autowired
    private DirectorCommentBookService directorCommentBookService;

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

        DirectorCommentBook directorCommentBook = directorCommentBookService.getByStudentId(id);
        if (directorCommentBook == null) {
            directorCommentBook = new DirectorCommentBook();
        }
        request.setAttribute("directorCommentBook", directorCommentBook);

        SubjectStudent subjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "my-subject-students/director-comment-book-edit";
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute("form") DirectorCommentBook directorCommentBook, HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(directorCommentBook.getStudentId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求学生id为空值");
        }

        DirectorCommentBook directorCommentBookFromDB = directorCommentBookService.getByStudentId(directorCommentBook.getStudentId());

        User user = RequestUtil.getLoginUserFromSession(request);

        if (directorCommentBookFromDB == null) {
            directorCommentBookFromDB = new DirectorCommentBook();
            EntityUtil.setCommonValue(directorCommentBookFromDB, user);
        } else {
            EntityUtil.setCommonUpdateValue(directorCommentBookFromDB, user);
        }

        directorCommentBookFromDB.setStudentId(directorCommentBook.getStudentId());
        directorCommentBookFromDB.setPlanProofScore(directorCommentBook.getPlanProofScore());
        directorCommentBookFromDB.setThesisDesignScore(directorCommentBook.getThesisDesignScore());
        directorCommentBookFromDB.setWorkloadDifficultyScore(directorCommentBook.getWorkloadDifficultyScore());
        directorCommentBookFromDB.setThesisQualityScore(directorCommentBook.getThesisQualityScore());
        directorCommentBookFromDB.setInnovatingWorthScore(directorCommentBook.getInnovatingWorthScore());
        directorCommentBookFromDB.setTotalScore(directorCommentBookFromDB.calculateTotalScre());
        directorCommentBookFromDB.setDirectorComment(directorCommentBook.getDirectorComment());

        boolean result = false;
        if (StringUtils.isEmpty(directorCommentBookFromDB.getId())) {
            result = directorCommentBookService.add(directorCommentBookFromDB);
        } else {
            result = directorCommentBookService.update(directorCommentBookFromDB);
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

        DirectorCommentBook directorCommentBook = directorCommentBookService.getByStudentId(id);
        if (directorCommentBook == null) {
            directorCommentBook = new DirectorCommentBook();
        }
        request.setAttribute("directorCommentBook", directorCommentBook);

        SubjectStudent subjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "my-subject-students/director-comment-book-print";
    }


    @RequestMapping(value = "/mine", method = RequestMethod.GET)
    public String mineView(HttpServletRequest request) throws Exception {

        User user = RequestUtil.getLoginUserFromSession(request);

        if (user == null) {
            throw new NotFoundException(HttpStatus.NOT_FOUND + "", "找不到该用户。");
        }

        DirectorCommentBook directorCommentBook = directorCommentBookService.getByStudentId(user.getId());
        if (directorCommentBook == null) {
            directorCommentBook = new DirectorCommentBook();
        }
        request.setAttribute("directorCommentBook", directorCommentBook);

        SubjectStudent subjectStudent = myStudentsService.getMySubjectStudentByStudentId(user.getId());

        request.setAttribute("subjectStudent", subjectStudent);

        return "my-subject-students/director-comment-book-mine";
    }

}
