package com.sword.gd.service;

import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.SubjectStudent;

/**
 * Created by Joker on 2017/4/22.
 */
public interface SubjectStudentsService {

    DataTablePage<SubjectStudent> getDirectorStudentsInfoPage(DatatableCondition condition, String directorId) throws Exception;

    SubjectStudent getMySubjectStudentByStudentId(String studentId);

    DataTablePage<SubjectStudent> getAllStudentsInfoPage(DatatableCondition condition);
}
