package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.ZTreeNode;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface RoleService extends BaseService<Role> {
    List<Role> getByUserId(String userId) throws  Exception;

    boolean exist(String name) throws Exception;

    boolean save(Role role)  throws Exception;

    boolean add(Role role, List<ZTreeNode> permissions)  throws Exception;
}
