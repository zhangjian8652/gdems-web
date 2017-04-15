package com.sword.admin.mapper;

import com.sword.admin.entity.UserRole;
import com.sword.admin.response.entity.DataTableUser;
import com.sword.admin.entity.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface UserMapper extends Mapper<User> {

     List<DataTableUser> getDatableUsers(@Param("searchValue")String searchValue, @Param("offset") int offset, @Param("limit") int limit);

     long getDatableUsersTotalCount(@Param("searchValue")String searchValue);

     int insertUserRole(@Param("userRole") UserRole userRole);

     int insertUserRoleBatch(@Param("userRoles") List<UserRole> userRoles);

     int updateUserRole(@Param("userRole") UserRole userRole);
}
