package com.sword.gd.service.impl;

import com.sword.gd.entity.TaskBook;
import com.sword.gd.mapper.TaskBookMapper;
import com.sword.gd.service.TaskBookService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/22.
 */
@Service
public class TaskBookServiceImpl implements TaskBookService {

    private static Logger logger = LogManager.getLogger(TaskBookServiceImpl.class);

    @Autowired
    private TaskBookMapper taskBookMapper;

    @Override
    public boolean add(TaskBook taskBook) {
        int result = taskBookMapper.insert(taskBook);
        return result > 0;
    }

    @Override
    public boolean update(TaskBook taskBook) {
        int result = taskBookMapper.updateByPrimaryKey(taskBook);

        return result > 0;
    }

    @Override
    public TaskBook getById(String id) {
        TaskBook taskBook = new TaskBook();
        taskBook.setId(id);
        return taskBookMapper.selectByPrimaryKey(taskBook);
    }

    @Override
    public TaskBook getByStudentId(String userId) {
        logger.info("start get TaskBook by student id");
        Example example = new Example(TaskBook.class);
        example.createCriteria().andEqualTo("studentId", userId);
        List<TaskBook> taskBooks = taskBookMapper.selectByExample(example);
        logger.info("end get TaskBooks by student id --  :");
        return  taskBooks != null && taskBooks.size() > 0 ? taskBooks.get(0) : null;
    }
}
