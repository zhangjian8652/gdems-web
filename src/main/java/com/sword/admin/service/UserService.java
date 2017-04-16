package com.sword.admin.service;

import com.sword.admin.entity.User;

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

    List<User> getUserByRoleName(String roleName) throws Exception ;
}
