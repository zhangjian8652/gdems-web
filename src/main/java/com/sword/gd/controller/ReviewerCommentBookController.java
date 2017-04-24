package com.sword.gd.controller;

import com.sword.admin.entity.User;
import com.sword.admin.entity.common.EntityUtil;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.exception.NotFoundException;
import com.sword.admin.exception.SwordException;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.response.JsonResponse;
import com.sword.admin.service.UserService;
import com.sword.gd.entity.SubjectStudent;
import com.sword.gd.entity.ReviewerCommentBook;
import com.sword.gd.service.SubjectStudentsService;
import com.sword.gd.service.ReviewerCommentBookService;
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
@RequestMapping("/gd/reviewercommentbook")
public class ReviewerCommentBookController {

    @Autowired
    private SubjectStudentsService myStudentsService;

    @Autowired
    private ReviewerCommentBookService reviewerCommentBookService;

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

        ReviewerCommentBook reviewerCommentBook = reviewerCommentBookService.getByStudentId(id);
        if (reviewerCommentBook == null) {
            reviewerCommentBook = new ReviewerCommentBook();
        }
        request.setAttribute("reviewerCommentBook", reviewerCommentBook);

        SubjectStudent subjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "subject-students/reviewer-comment-book-edit";
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@ModelAttribute("form") ReviewerCommentBook reviewerCommentBook, HttpServletRequest request) throws Exception {

        if (StringUtils.isEmpty(reviewerCommentBook.getStudentId())) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求学生id为空值");
        }

        ReviewerCommentBook reviewerCommentBookFromDB = reviewerCommentBookService.getByStudentId(reviewerCommentBook.getStudentId());

        User user = RequestUtil.getLoginUserFromSession(request);

        if (reviewerCommentBookFromDB == null) {
            reviewerCommentBookFromDB = new ReviewerCommentBook();
            EntityUtil.setCommonValue(reviewerCommentBookFromDB, user);
        } else {
            EntityUtil.setCommonUpdateValue(reviewerCommentBookFromDB, user);
        }

        reviewerCommentBookFromDB.setStudentId(reviewerCommentBook.getStudentId());
        //TODO 设置字段信息
        reviewerCommentBookFromDB.setStandardizeDegreeScore(reviewerCommentBook.getStandardizeDegreeScore());
        reviewerCommentBookFromDB.setContentQualityScore(reviewerCommentBook.getContentQualityScore());
        reviewerCommentBookFromDB.setInnovatingWorthScore(reviewerCommentBook.getInnovatingWorthScore());
        reviewerCommentBookFromDB.setTotalScore(reviewerCommentBook.calculateTotalScore());
        reviewerCommentBookFromDB.setReviewerComment(reviewerCommentBook.getReviewerComment());

        boolean result = false;
        if (StringUtils.isEmpty(reviewerCommentBookFromDB.getId())) {
            result = reviewerCommentBookService.add(reviewerCommentBookFromDB);
        } else {
            result = reviewerCommentBookService.update(reviewerCommentBookFromDB);
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

        ReviewerCommentBook reviewerCommentBook = reviewerCommentBookService.getByStudentId(id);
        if (reviewerCommentBook == null) {
            reviewerCommentBook = new ReviewerCommentBook();
        }
        request.setAttribute("reviewerCommentBook", reviewerCommentBook);

        SubjectStudent subjectStudent = myStudentsService.getMySubjectStudentByStudentId(id);

        request.setAttribute("subjectStudent", subjectStudent);

        return "subject-students/reviewer-comment-book-print";
    }

}
