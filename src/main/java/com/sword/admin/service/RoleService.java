package com.sword.admin.service;

import com.sword.admin.entity.Role;
import com.sword.admin.entity.ZTreeNode;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface RoleService extends BaseService<Role> {
    List<Role> getByUserId(String userId) throws  Exception;

    boolean exist(String name) throws Exception;

    boolean save(Role role)  throws Exception;

    boolean add(Role role, List<ZTreeNode> permissions)  throws Exception;

    Role getById(String id) throws Exception;

    boolean update(Role role, List<ZTreeNode> zTreeNodes)  throws Exception;

    boolean delete(Role role) throws Exception;
}
