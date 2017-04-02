package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Menu;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface MenuService extends BaseService<Menu> {

    List<Menu> getByRoleId(String roleId) throws Exception;

    List<Menu> getByUserId(String userId) throws Exception;

}
