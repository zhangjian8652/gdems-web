package com.sword.gd.service;

import com.sword.gd.entity.ReviewerCommentBook;

/**
 * Created by Joker on 2017/4/23.
 */
public interface ReviewerCommentBookService {

    boolean add(ReviewerCommentBook reviewerCommentBook);

    boolean update(ReviewerCommentBook reviewerCommentBook);

    ReviewerCommentBook getById(String id);

    ReviewerCommentBook getByStudentId(String userId);
}
