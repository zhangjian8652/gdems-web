package com.sword.gd.service.impl;

import com.sword.gd.entity.DirectorCommentBook;
import com.sword.gd.entity.InterimCheckBook;
import com.sword.gd.mapper.DirectorCommentBookMapper;
import com.sword.gd.mapper.InterimCheckBookMapper;
import com.sword.gd.service.DirectorCommentBookService;
import com.sword.gd.service.InterimCheckBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/23.
 */
@Service
public class DirectorCommentBookServiceImpl implements DirectorCommentBookService {

    @Autowired
    private DirectorCommentBookMapper directorCommentBookMapper;
    @Override
    public boolean add(DirectorCommentBook directorCommentBook) {
        int result = directorCommentBookMapper.insert(directorCommentBook);
        return result>0;
    }

    @Override
    public boolean update(DirectorCommentBook directorCommentBook) {
        int result = directorCommentBookMapper.updateByPrimaryKey(directorCommentBook);
        return result>0;
    }

    @Override
    public DirectorCommentBook getById(String id) {
        DirectorCommentBook directorCommentBook = new DirectorCommentBook();
        directorCommentBook.setId(id);
        return directorCommentBookMapper.selectByPrimaryKey(directorCommentBook);
    }

    @Override
    public DirectorCommentBook getByStudentId(String userId) {
        Example example = new Example(InterimCheckBook.class);
        example.createCriteria().andEqualTo("studentId", userId);

        List<DirectorCommentBook> directorCommentBooks = directorCommentBookMapper.selectByExample(example);

        return directorCommentBooks != null && directorCommentBooks.size()>0?directorCommentBooks.get(0):null;
    }
}
