package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.mapper.MenuMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.MenuService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class MenuServiceImpl implements MenuService {

    private static Logger logger = LogManager.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public DataTablePage<Menu> page(DatatableCondition condition) throws Exception {
        return null;
    }

    @Override
    public Menu entity(Menu menu) throws Exception {
        return null;
    }

    @Override
    public List<Menu> list(Menu menu) throws Exception {

        return null;
    }

    @Override
    public List<Menu> getByRoleId(String roleId) throws Exception {
        return menuMapper.getByRoleId(roleId);
    }

    @Override
    public List<Menu> getByUserId(String userId) {
        return menuMapper.getByUserId(userId);
    }

    @Override
    public List<Menu> getByParentId(String parentId) throws Exception {

        //如果父菜单id位空则查顶级菜单
        if (StringUtils.isEmpty(parentId)) {
            return getTopMenu();
        }

        //否则查出所有对应子集菜单
        Menu menu = new Menu();
        menu.setParentId(parentId);
        return menuMapper.select(menu);
    }

    @Override
    public List<Menu> getTopMenu() throws Exception {
        Menu menu = new Menu();
        menu.setParentId(Menu.NONE_PARENT_ID);
        return menuMapper.select(menu);
    }

    @Override
    public List<Menu> list() throws Exception {
        Example example = new Example(Menu.class);
        example.orderBy("createDate").desc();
        return menuMapper.selectByExample(example);
    }

    @Override
    public boolean save(Menu menu) throws Exception {
        updateMenuToParent(menu);
        return menuMapper.insert(menu) > 0;
    }

    @Override
    public boolean exist(Menu menu) throws Exception {
        return menuMapper.select(menu).size() > 0;
    }

    /**
     * 如果此菜单存在父菜单，则检查父菜单属性，如果不是parent属性，则设置成parent
     *
     * @param menu
     */
    private void updateMenuToParent(Menu menu) throws Exception {
        logger.debug("update parent menu is parent:" + menu.getParentId());
        if (!StringUtils.isEmpty(menu.getParentId()) && Menu.NONE_PARENT_ID.equalsIgnoreCase(menu.getParentId())) {
            Menu condition = new Menu();
            condition.setParentId(menu.getParentId());
            Menu parentMenu = menuMapper.selectByPrimaryKey(condition);
            logger.debug("update parent menu :" + parentMenu.getName());
            if (parentMenu.getIsParent() == null || Menu.IS_NOT_PARENT.equalsIgnoreCase(parentMenu.getIsParent())) {
                parentMenu.setIsParent(Menu.IS_PARENT);
                menuMapper.updateByPrimaryKey(parentMenu);
            }

        }
    }
}
