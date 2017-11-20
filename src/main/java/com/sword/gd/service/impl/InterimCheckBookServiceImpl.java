package com.sword.gd.service.impl;

import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.entity.TaskBook;
import com.sword.gd.mapper.InterimCheckBookMapper;
import com.sword.gd.service.InterimCheckBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/23.
 */
@Service
public class InterimCheckBookServiceImpl implements InterimCheckBookService {

    @Autowired
    private InterimCheckBookMapper interimCheckBookMapper;
    @Override
    public boolean add(InterimCheckBook interimCheckBook) {
        int result = interimCheckBookMapper.insert(interimCheckBook);
        return result>0;
    }

    @Override
    public boolean update(InterimCheckBook interimCheckBook) {
        int result = interimCheckBookMapper.updateByPrimaryKey(interimCheckBook);
        return result>0;
    }

    @Override
    public InterimCheckBook getById(String id) {
        InterimCheckBook interimCheckBook = new InterimCheckBook();
        interimCheckBook.setId(id);
        return interimCheckBookMapper.selectByPrimaryKey(interimCheckBook);
    }

    @Override
    public InterimCheckBook getByStudentId(String userId) {
        Example example = new Example(InterimCheckBook.class);
        example.createCriteria().andEqualTo("studentId", userId);

        List<InterimCheckBook> interimCheckBooks = interimCheckBookMapper.selectByExample(example);

        return interimCheckBooks != null && interimCheckBooks.size()>0?interimCheckBooks.get(0):null;
    }
}
