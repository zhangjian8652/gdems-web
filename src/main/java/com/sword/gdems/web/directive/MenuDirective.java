package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.MenuService;
import com.sword.gdems.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public class MenuDirective extends AbstractDirective<Menu> {

    @Autowired
    private MenuService menuService;

    @Override
    protected boolean isOk(Map map) {
        return false;
    }

    @Override
    protected DataTablePage<Menu> page(Map map) throws Exception {
        return null;
    }
    @Override
    protected List<Menu> list(Map map) throws Exception{
        String roleId =  DirectiveUtils.getString("roleId", map);
        String userId =  DirectiveUtils.getString("userId", map);
        if (!StringUtils.isEmpty(roleId)) {
            return menuService.getByRoleId(roleId);
        }

        if (!StringUtils.isEmpty(userId)) {
            return menuService.getByUserId(userId);
        }

        return null;
    }

    @Override
    protected Menu entity(Map map) throws Exception{
        return null;
    }

}
