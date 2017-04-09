package com.sword.gdems.web.mapper;

import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.RoleMenu;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface RoleMapper extends Mapper<Role> {

    List<Role> getByUserId(String userId);

    int insertRoleMenuBatch(@Param("roleMenus") List<RoleMenu> roleMenus);

    int deleteRoleMenuByRoleId(@Param("roleId") String roleId);
}
