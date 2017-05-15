package com.sword.admin.service;

import com.sword.admin.exception.AuthenticationException;
import com.sword.admin.entity.User;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface UserAuthorizable {

    User auth(User user) throws AuthenticationException;
}
