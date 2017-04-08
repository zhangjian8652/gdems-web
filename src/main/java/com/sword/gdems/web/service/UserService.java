package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface UserService extends BaseService<User> {

    boolean exist(String loginName) throws Exception;

    List<User> all() throws Exception;

    boolean save(User user)  throws Exception;

    boolean save(User user, String roleId) throws Exception;

    boolean deleteById(String id) throws Exception;

    User getUserById(String id) throws Exception;

    boolean updateUser(User userFromDB,String roleId) throws Exception;
}
