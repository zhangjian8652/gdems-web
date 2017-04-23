package com.sword.gd.service.impl;

import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.MySubjectStudent;
import com.sword.gd.mapper.MySubjectStudentsMapper;
import com.sword.gd.service.MySubjectStudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/22.
 */
@Service
public class MySubjectStudentsServiceImpl implements MySubjectStudentsService {

    @Autowired
    private MySubjectStudentsMapper mySubjectStudentsMapper;

    @Override
    public DataTablePage<MySubjectStudent> getDirectorStudentsInfoPage(DatatableCondition condition, String directorId) throws Exception {

        List<MySubjectStudent> directorSubjectStudentses = mySubjectStudentsMapper.getDirectorStudentsInfoPage(directorId, condition.getStart(), condition.getLength());
        int count = mySubjectStudentsMapper.getDirectorStudentsInfoPageCount(directorId);

        DataTablePage<MySubjectStudent> dataTablePage = new DataTablePage<MySubjectStudent>(condition.getDraw(), count, count, directorSubjectStudentses);

        return dataTablePage;
    }

    @Override
    public MySubjectStudent getMySubjectStudentByStudentId(String studentId) {
        return mySubjectStudentsMapper.getMySubjectStudentByStudentId(studentId);
    }
}
