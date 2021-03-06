package com.sword.admin.service.impl;

import com.sword.admin.common.encrypt.util.EncryptUtil;
import com.sword.admin.config.ErrorCodeConfig;
import com.sword.admin.config.GlobalConfig;
import com.sword.admin.entity.User;
import com.sword.admin.exception.AuthenticationException;
import com.sword.admin.mapper.UserMapper;
import com.sword.admin.service.UserAuthorizable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import static com.sword.admin.service.impl.UserAuthor.AuthType.USERNAME_PASSWORD;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
@Service
public class UserAuthor implements UserAuthorizable {


    private AuthType authType;

    @Autowired
    private UserMapper userMapper;


    public UserAuthor() {
        this.authType = USERNAME_PASSWORD;
    }

    public void stategy(AuthType authType){
        this.authType = authType;
    }

    public User auth(User user) throws AuthenticationException {


        try {
            user.setPassword(EncryptUtil.SHA_1(user.getPassword(), GlobalConfig.PASSWORD_SALT));
        } catch (NoSuchAlgorithmException e) {
            throw new AuthenticationException(ErrorCodeConfig.INTERNAL_ERROR,ErrorCodeConfig.getMessage(ErrorCodeConfig.INTERNAL_ERROR));
        }

        /**
         * 根据不同方式做不同的认证，目前只支持用户命名密码，或者邮箱密码，或者都兼容
         */
        switch (this.authType){
            case USERNAME_PASSWORD:
                return userPasswordAuth(user);
            case EMAIL_PASSWORD:
                return emailPasswordAuth(user);
            case USERNAME_OR_EMAIL_PASSWORD:
                return usernameOrEmailPasswordAuth(user);
            default:
                return userPasswordAuth(user);
        }
    }

    /**
     * 邮箱或者用户名登录验证
     * @param user
     * @return
     * @throws AuthenticationException
     */
    private User usernameOrEmailPasswordAuth(User user) throws AuthenticationException{


        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("loginName",user.getLoginName())
                .andEqualTo("password",user.getPassword());
        example.or(example.createCriteria().andEqualTo("email",user.getEmail())
                .andEqualTo("password",user.getPassword()));

        List<User> resultUsers = userMapper.selectByExample(example);

        if(resultUsers == null || resultUsers.size() == 0){
            throw new AuthenticationException(ErrorCodeConfig.USERNAME_OR_EMAIL_PASSWORD_USER_NOT_FOUND,ErrorCodeConfig.getMessage(ErrorCodeConfig.USERNAME_OR_EMAIL_PASSWORD_USER_NOT_FOUND));
        }
        return resultUsers.get(0);
    }

    /**
     * 邮箱密码登陆验证
     * @param user
     * @return
     * @throws AuthenticationException
     */
    private User emailPasswordAuth(User user) throws AuthenticationException {

        User conditionUser = new User();
        conditionUser.setEmail(user.getEmail());
        conditionUser.setPassword(user.getPassword());

        User resultUser = userMapper.selectOne(user);
        if(resultUser == null){
            throw new AuthenticationException(ErrorCodeConfig.EMAIL_PASSWORD_USER_NOT_FOUND,ErrorCodeConfig.getMessage(ErrorCodeConfig.EMAIL_PASSWORD_USER_NOT_FOUND));
        }
        return resultUser;
    }

    /**
     * 用户名密码登录验证
     * @param user
     * @return
     * @throws AuthenticationException
     */
    private User userPasswordAuth(User user) throws AuthenticationException{
        User conditionUser = new User();
        conditionUser.setLoginName(user.getLoginName());
        conditionUser.setPassword(user.getPassword());

        User resultUser = userMapper.selectOne(conditionUser);
        if(resultUser == null){
            throw new AuthenticationException(ErrorCodeConfig.USERNAME_PASSWORD_NOT_FOUND,ErrorCodeConfig.getMessage(ErrorCodeConfig.USERNAME_PASSWORD_NOT_FOUND));
        }
        return resultUser;
    }


    enum AuthType{
        USERNAME_PASSWORD,EMAIL_PASSWORD,USERNAME_OR_EMAIL_PASSWORD
    }

}
