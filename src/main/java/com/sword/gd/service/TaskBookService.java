package com.sword.gd.service;

import com.sword.gd.entity.TaskBook;

/**
 * Created by Joker on 2017/4/22.
 */
public interface TaskBookService {
    boolean add(TaskBook taskBook);

    boolean update(TaskBook taskBook);

    TaskBook getById(String id);

    TaskBook getByStudentId(String userId);
}
