package com.sword.admin.directive;

import com.sword.admin.common.directive.DirectiveUtils;
import com.sword.admin.entity.Menu;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.service.MenuService;
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
        String userId =  DirectiveUtils.getString("userId", map);

        if (StringUtils.isEmpty(parentId) && StringUtils.isEmpty(userId)) {
            menusList =   menuService.getTop();
            return menusList;
        }

        if (StringUtils.isEmpty(parentId) && !StringUtils.isEmpty(userId)) {
            menusList =  menuService.getTopByUserId(userId);
            return menusList;
        }


        if (!StringUtils.isEmpty(parentId) && StringUtils.isEmpty(userId)) {
            menusList =  menuService.getByParentId(parentId);
            return menusList;
        }

        if (!StringUtils.isEmpty(parentId) && !StringUtils.isEmpty(userId)) {
            //根据用户id和parentId获取菜单列
            menusList =  menuService.getByUserIdAndParentId(userId,parentId);
            return menusList;
        }



        menusList = menuService.getTop();
        return menusList;


    }

    @Override
    protected Menu entity(Map map) throws Exception{
        return null;
    }

}
