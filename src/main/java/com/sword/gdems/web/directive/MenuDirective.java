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
        //如果时查询所有菜单节点则查询返回所有菜单节点
        String queryAll =  DirectiveUtils.getString("all", map);
        List<Menu> menusList;
        if (!StringUtils.isEmpty(queryAll) && "YES".equalsIgnoreCase(queryAll)) {
            menusList = menuService.list();
            return menusList;
        }

        //如果不是就根据父ID查询子菜单
        String parentId =  DirectiveUtils.getString("parentId", map);
        menusList =  menuService.getByParentId(parentId);
        return menusList;
    }

    @Override
    protected Menu entity(Map map) throws Exception{
        return null;
    }

}
