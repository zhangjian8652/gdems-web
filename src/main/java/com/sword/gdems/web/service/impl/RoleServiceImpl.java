package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataTablePage<Role> page(DatatableCondition condition) throws Exception {
        return null;
    }

    @Override
    public Role entity(Role role) throws Exception {
        return roleMapper.selectOne(role);
    }

    @Override
    public List<Role> list(Role role) throws Exception {
        return roleMapper.select(role);
    }

    @Override
    public List<Role> getByUserId(String userId) throws Exception {
        return roleMapper.getByUserId(userId);
    }
}
