package com.sword.gd.service;

import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.entity.TaskBook;

/**
 * Created by Joker on 2017/4/23.
 */
public interface InterimCheckBookService {

    boolean add(InterimCheckBook interimCheckBook);

    boolean update(InterimCheckBook interimCheckBook);

    InterimCheckBook getById(String id);

    InterimCheckBook getByStudentId(String userId);
}
