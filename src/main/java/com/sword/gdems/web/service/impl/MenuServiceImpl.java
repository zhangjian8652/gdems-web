package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.mapper.MenuMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class MenuServiceImpl implements MenuService {
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

}
