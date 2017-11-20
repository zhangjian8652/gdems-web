package com.sword.gd.service.impl;

import com.sword.gd.entity.ExaminationCommentBook;
import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.mapper.ExaminationCommentBookMapper;
import com.sword.gd.service.ExaminationCommentBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/23.
 */
@Service
public class ExaminationCommentBookServiceImpl implements ExaminationCommentBookService {

    @Autowired
    private ExaminationCommentBookMapper examinationCommentBookMapper;
    @Override
    public boolean add(ExaminationCommentBook examinationCommentBook) {
        int result = examinationCommentBookMapper.insert(examinationCommentBook);
        return result>0;
    }

    @Override
    public boolean update(ExaminationCommentBook examinationCommentBook) {
        int result = examinationCommentBookMapper.updateByPrimaryKey(examinationCommentBook);
        return result>0;
    }

    @Override
    public ExaminationCommentBook getById(String id) {
        ExaminationCommentBook examinationCommentBook = new ExaminationCommentBook();
        examinationCommentBook.setId(id);
        return examinationCommentBookMapper.selectByPrimaryKey(examinationCommentBook);
    }

    @Override
    public ExaminationCommentBook getByStudentId(String userId) {
        Example example = new Example(InterimCheckBook.class);
        example.createCriteria().andEqualTo("studentId", userId);

        List<ExaminationCommentBook> examinationCommentBooks = examinationCommentBookMapper.selectByExample(example);

        return examinationCommentBooks != null && examinationCommentBooks.size()>0?examinationCommentBooks.get(0):null;
    }
}
