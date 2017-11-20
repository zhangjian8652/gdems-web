package com.sword.gd.mapper;

import com.sword.gd.entity.SubjectStudent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/4/22.
 */
public interface SubjectStudentsMapper {
    List<SubjectStudent> getDirectorStudentsInfoPage(@Param("directorId") String directorId, @Param("offset") int offset, @Param("limit") int limit);

    int getDirectorStudentsInfoPageCount(@Param("directorId") String directorId);

    SubjectStudent getMySubjectStudentByStudentId(@Param("studentId") String studentId);

    List<SubjectStudent> getAllStudentsInfoPage(@Param("offset") Integer start, @Param("limit")  Integer length,@Param("subjectStudent") SubjectStudent subjectStudent);

    int getAllStudentsInfoPageCount(@Param("subjectStudent") SubjectStudent subjectStudent);

}
