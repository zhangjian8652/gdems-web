package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Menu;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface MenuService extends BaseService<Menu> {

    List<Menu> getByRoleId(String roleId) throws Exception;

    List<Menu> getByUserId(String userId) throws Exception;

    List<Menu> getByParentId(String parentId) throws Exception;

    List<Menu> getTop() throws Exception;

    List<Menu> list()  throws Exception;

    boolean save(Menu menu) throws Exception;

    boolean exist(Menu menu) throws Exception;

    Menu getById(String id) throws Exception;
}
