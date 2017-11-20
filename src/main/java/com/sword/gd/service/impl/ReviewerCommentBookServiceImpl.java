package com.sword.gd.service.impl;

import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.entity.ReviewerCommentBook;
import com.sword.gd.mapper.ReviewerCommentBookMapper;
import com.sword.gd.service.ReviewerCommentBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/23.
 */
@Service
public class ReviewerCommentBookServiceImpl implements ReviewerCommentBookService {

    @Autowired
    private ReviewerCommentBookMapper reviewerCommentBookMapper;
    @Override
    public boolean add(ReviewerCommentBook reviewerCommentBook) {
        int result = reviewerCommentBookMapper.insert(reviewerCommentBook);
        return result>0;
    }

    @Override
    public boolean update(ReviewerCommentBook reviewerCommentBook) {
        int result = reviewerCommentBookMapper.updateByPrimaryKey(reviewerCommentBook);
        return result>0;
    }

    @Override
    public ReviewerCommentBook getById(String id) {
        ReviewerCommentBook reviewerCommentBook = new ReviewerCommentBook();
        reviewerCommentBook.setId(id);
        return reviewerCommentBookMapper.selectByPrimaryKey(reviewerCommentBook);
    }

    @Override
    public ReviewerCommentBook getByStudentId(String userId) {
        Example example = new Example(InterimCheckBook.class);
        example.createCriteria().andEqualTo("studentId", userId);

        List<ReviewerCommentBook> reviewerCommentBooks = reviewerCommentBookMapper.selectByExample(example);

        return reviewerCommentBooks != null && reviewerCommentBooks.size()>0?reviewerCommentBooks.get(0):null;
    }
}
