package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Role;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface RoleService extends BaseService<Role> {
    List<Role> getByUserId(String userId) throws  Exception;
}
