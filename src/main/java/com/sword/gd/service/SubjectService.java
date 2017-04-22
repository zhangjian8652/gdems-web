package com.sword.gd.service;

import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.gd.entity.Subject;

import java.util.List;


/**
 * Created by Joker on 2017/4/15.
 */
public interface SubjectService {

    boolean add(Subject subject) throws Exception;

    boolean delete(String id) throws Exception;

    boolean update(Subject subject) throws Exception;

    DataTablePage<Subject> pageData(DatatableCondition datatableCondition) throws Exception;

    List<Subject> getByTittle(String tittle) throws Exception;

    Subject getById(String id) throws Exception;

    List<Subject> getAvailable() throws Exception;

    DataTablePage<Subject> verifyPageData(DatatableCondition datatableCondition) throws Exception;

    DataTablePage<Subject> pageDirectorSubjects(DatatableCondition datatableCondition, String id) throws Exception;

    Subject getByChooseUserId(String id) throws Exception;

    boolean chooseSubject(Subject subject, Subject chooseSubject) throws Exception;

    int getCreateAvailableCountByUserId(String userId) throws Exception;

    DataTablePage<Subject> pageStudentSubjects(DatatableCondition datatableCondition, String id) throws Exception;
}
