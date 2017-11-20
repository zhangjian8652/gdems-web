package com.sword.unittest.mapper;

import com.sword.admin.common.encrypt.util.EncryptUtil;
import com.sword.admin.config.GlobalConfig;
import org.junit.Test;

import java.security.NoSuchAlgorithmException;

/**
 * Created by Joker on 2017/4/8.
 */
public class Password {
    @Test
    public  void a() throws NoSuchAlgorithmException {
        System.out.println(EncryptUtil.SHA_1("123456", GlobalConfig.PASSWORD_SALT));
    }

}
