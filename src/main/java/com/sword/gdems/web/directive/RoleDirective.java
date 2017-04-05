package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.RoleService;
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
