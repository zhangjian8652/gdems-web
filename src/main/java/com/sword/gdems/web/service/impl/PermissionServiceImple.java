package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.mapper.MenuMapper;
import com.sword.gdems.web.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class PermissionServiceImple implements PermissionService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public boolean hasPermission(String permission, String userId) throws Exception {
        List<Menu> menus = menuMapper.getByPermissionAndUserId(permission, userId);
        return menus.size() > 0;
    }
}
