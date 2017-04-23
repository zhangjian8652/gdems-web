package com.sword.gd.mapper;

import com.sword.gd.entity.MySubjectStudent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/4/22.
 */
public interface MySubjectStudentsMapper {
    List<MySubjectStudent> getDirectorStudentsInfoPage(@Param("directorId") String directorId, @Param("offset") int offset, @Param("limit") int limit);

    int getDirectorStudentsInfoPageCount(@Param("directorId") String directorId);

    MySubjectStudent getMySubjectStudentByStudentId(@Param("studentId") String studentId);
}
