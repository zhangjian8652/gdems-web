package com.sword.gdems.web.mapper;

import com.sword.gdems.web.entity.Menu;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface MenuMapper extends Mapper<Menu> {
    List<Menu> getByRoleId(@Param("roleId") String roleId) throws  Exception;

    List<Menu> getByUserId(@Param("userId") String userId);

    List<Menu> getByPermissionAndUserId(@Param("permission") String permission,@Param("userId") String userId);

    List<Menu> getByUserIdAndParentId(@Param("userId") String userId,@Param("parentId") String parentId);

    List<Menu> getTopByUserId(@Param("userId") String userId);
}
