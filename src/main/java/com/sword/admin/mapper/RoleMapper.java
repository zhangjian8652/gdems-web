package com.sword.admin.mapper;

import com.sword.admin.entity.Role;
import com.sword.admin.entity.RoleMenu;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface RoleMapper extends Mapper<Role> {

    List<Role> getByUserId(String userId);

    int insertRoleMenuBatch(@Param("roleMenus") List<RoleMenu> roleMenus);

    int deleteRoleMenuByRoleId(@Param("roleId") String roleId);
}
