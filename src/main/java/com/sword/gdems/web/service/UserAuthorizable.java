package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.exception.AuthenticationException;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface UserAuthorizable {

    User auth(User user) throws AuthenticationException;
}
