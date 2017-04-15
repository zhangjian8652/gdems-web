package com.sword.admin.directive;

import com.sword.admin.common.directive.DirectiveUtils;
import com.sword.admin.entity.Role;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public class RoleDirective extends AbstractDirective<Role> {

    @Autowired
    private RoleService roleService;

    @Override
    protected boolean isOk(Map map) {
        return false;
    }

    @Override
    protected DataTablePage<Role> page(Map map) throws Exception {
        String searchValue =  DirectiveUtils.getString("searchValue", map);
        int offset =  DirectiveUtils.getInt("offset", map);
        int limit =  DirectiveUtils.getInt("limit", map);
        int draw =  DirectiveUtils.getInt("draw", map);

        DatatableCondition condition = new DatatableCondition(offset, limit, searchValue, draw);
        return roleService.page(condition);
    }

    @Override
    protected List<Role> list(Map map) throws Exception {
        String userId = DirectiveUtils.getString("userId", map);
        if(!StringUtils.isEmpty(userId)){
           return roleService.getByUserId(userId);
        }
        Role role = new Role();
        return roleService.list(role);
    }

    @Override
    protected Role entity(Map map) throws Exception {
        String id = DirectiveUtils.getString("id", map);

        if (StringUtils.isEmpty(id)) {
            return null;
        }

        Role role = new Role();
        role.setId(id);
        return roleService.entity(role);
    }
}
