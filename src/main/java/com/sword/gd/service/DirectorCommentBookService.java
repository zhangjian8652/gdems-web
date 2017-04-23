package com.sword.gd.service;

import com.sword.gd.entity.DirectorCommentBook;
import com.sword.gd.entity.InterimCheckBook;

/**
 * Created by Joker on 2017/4/23.
 */
public interface DirectorCommentBookService {

    boolean add(DirectorCommentBook directorCommentBook);

    boolean update(DirectorCommentBook directorCommentBook);

    DirectorCommentBook getById(String id);

    DirectorCommentBook getByStudentId(String userId);
}
