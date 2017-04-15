package com.sword.gd.service.impl;

import com.sword.admin.entity.User;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.Subject;
import com.sword.gd.mapper.SubjectMapper;
import com.sword.gd.service.SubjectService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/15.
 */
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    @Override
    public boolean add(Subject subject) throws Exception {
        int result = subjectMapper.insert(subject);
        return result > 0;
    }

    @Override
    public boolean delete(String id) throws Exception {
        Subject subject = new Subject();
        subject.setId(id);
        int result = subjectMapper.delete(subject);
        return result > 0;
    }

    @Override
    public boolean update(Subject subject) throws Exception {
        int result = subjectMapper.updateByPrimaryKey(subject);
        return result > 0;
    }

    @Override
    public DataTablePage<Subject> pageData(DatatableCondition condition) throws Exception {

        /**
         * 增加like条件查询
         */
        Example example = new Example(Subject.class);

        if (!StringUtils.isEmpty(condition.getSearchValue())) {
            example.or().andLike("tittle", "%" + condition.getSearchValue() + "%");
        }

        /**
         * 按照创建日期排序
         */
        example.orderBy("createDate").desc();

        /**
         * 分页条件
         */
        RowBounds rowBounds = new RowBounds(condition.getStart(), condition.getLength());

        /**
         * 查询满足条件的用户数据以及总数
         */
        List<Subject> users = subjectMapper.selectByExampleAndRowBounds(example, rowBounds);
        long count = subjectMapper.selectCountByExample(example);

        DataTablePage<Subject> dataTablePage = new DataTablePage<Subject>(condition.getDraw(), count, count, users);

        return dataTablePage;
    }

    @Override
    public List<Subject> getByTittle(String tittle) throws Exception {

        Example example = new Example(Subject.class);
        example.createCriteria().andEqualTo("tittle", tittle);
        List<Subject> subjects = subjectMapper.selectByExample(example);
        return subjects;
    }

    @Override
    public Subject getById(String id) throws Exception {
        Subject subject = new Subject();
        subject.setId(id);
        return subjectMapper.selectByPrimaryKey(subject);
    }

    @Override
    public List<Subject> getAvailable() throws Exception {
        Example example = new Example(Subject.class);
        example.createCriteria().andEqualTo("status", Subject.Status.APPROVED)
                .andEqualTo("chooseStatus", Subject.ChooseStatus.NONE_CHOOSE);
        example.orderBy("createDate").desc();
        List<Subject> subjects = subjectMapper.selectByExample(example);

        return subjects;
    }

    @Override
    public DataTablePage<Subject> toVerifypageData(DatatableCondition condition) throws Exception {
        /**
         * 增加like条件查询
         */
        Example example = new Example(Subject.class);

        example.createCriteria().andEqualTo("status", Subject.Status.CREATED);

        /*
         * 按照创建日期排序
         */
        example.orderBy("createDate").desc();

        /**
         * 分页条件
         */
        RowBounds rowBounds = new RowBounds(condition.getStart(), condition.getLength());

        /**
         * 查询满足条件的用户数据以及总数
         */
        List<Subject> users = subjectMapper.selectByExampleAndRowBounds(example, rowBounds);
        long count = subjectMapper.selectCountByExample(example);

        DataTablePage<Subject> dataTablePage = new DataTablePage<Subject>(condition.getDraw(), count, count, users);

        return dataTablePage;
    }
}
