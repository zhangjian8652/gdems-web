package com.sword.gd.service;

import com.sword.gd.entity.ExaminationCommentBook;
import com.sword.gd.entity.ReviewerCommentBook;

/**
 * Created by Joker on 2017/4/23.
 */
public interface ExaminationCommentBookService {

    boolean add(ExaminationCommentBook examinationCommentBook);

    boolean update(ExaminationCommentBook examinationCommentBook);

    ExaminationCommentBook getById(String id);

    ExaminationCommentBook getByStudentId(String userId);
}
