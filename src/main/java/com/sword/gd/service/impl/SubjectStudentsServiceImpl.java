package com.sword.gd.service.impl;

import com.sword.admin.entity.Organization;
import com.sword.admin.entity.User;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.SubjectStudent;
import com.sword.gd.mapper.SubjectStudentsMapper;
import com.sword.gd.service.SubjectStudentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/22.
 */
@Service
public class SubjectStudentsServiceImpl implements SubjectStudentsService {

    @Autowired
    private SubjectStudentsMapper subjectStudentsMapper;

    @Override
    public DataTablePage<SubjectStudent> getDirectorStudentsInfoPage(DatatableCondition condition, String directorId) throws Exception {

        List<SubjectStudent> directorSubjectStudentses = subjectStudentsMapper.getDirectorStudentsInfoPage(directorId, condition.getStart(), condition.getLength());
        int count = subjectStudentsMapper.getDirectorStudentsInfoPageCount(directorId);

        DataTablePage<SubjectStudent> dataTablePage = new DataTablePage<SubjectStudent>(condition.getDraw(), count, count, directorSubjectStudentses);

        return dataTablePage;
    }

    @Override
    public SubjectStudent getMySubjectStudentByStudentId(String studentId) {
        return subjectStudentsMapper.getMySubjectStudentByStudentId(studentId);
    }

    @Override
    public DataTablePage<SubjectStudent> getAllStudentsInfoPage(DatatableCondition condition) {

        SubjectStudent subjectStudent = new SubjectStudent();
        User student = new User();
        student.setLoginName(condition.getSearchValue());
        subjectStudent.setStudent(student);
        User director = new User();
        director.setLoginName(condition.getSearchValue());

        List<SubjectStudent> directorSubjectStudentses = subjectStudentsMapper.getAllStudentsInfoPage(condition.getStart(), condition.getLength(),subjectStudent);
        int count = subjectStudentsMapper.getAllStudentsInfoPageCount(subjectStudent);

        DataTablePage<SubjectStudent> dataTablePage = new DataTablePage<SubjectStudent>(condition.getDraw(), count, count, directorSubjectStudentses);

        return dataTablePage;
    }
}
