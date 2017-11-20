package com.sword.admin.service;

/**
 * Created by Joker on 2017/4/2.
 */
public interface PermissionService {
    boolean hasPermission(String permission,String userId) throws Exception;
}
