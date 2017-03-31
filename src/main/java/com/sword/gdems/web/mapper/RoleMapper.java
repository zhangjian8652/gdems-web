package com.sword.gdems.web.mapper;

import com.sword.gdems.web.entity.Role;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface RoleMapper extends Mapper<Role> {

    List<Role> getRolesByUserId(String userId);
}
