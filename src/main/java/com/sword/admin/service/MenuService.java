package com.sword.admin.service;

import com.sword.admin.entity.Menu;

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

    boolean update(Menu menuFromDB) throws Exception;

    List<Menu> getByUserIdAndParentId(String userId, String parentId) throws Exception;

    List<Menu> getTopByUserId(String userId)  throws Exception;

    boolean deleteById(String id) throws Exception;

    List<Menu> getAll() throws Exception;

}
