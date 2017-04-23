package com.sword.gd.service;

import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.MySubjectStudent;

/**
 * Created by Joker on 2017/4/22.
 */
public interface MySubjectStudentsService {

    DataTablePage<MySubjectStudent> getDirectorStudentsInfoPage(DatatableCondition condition, String directorId) throws Exception;

    MySubjectStudent getMySubjectStudentByStudentId(String studentId);
}
