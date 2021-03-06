package com.sword.unittest.encrypt;

import com.sword.admin.common.encrypt.util.EncryptUtil;
import com.sword.admin.config.GlobalConfig;
import org.junit.Test;

import java.security.NoSuchAlgorithmException;

/**
 * @Author zhengzhe
 * @Date 2017/3/30
 * @Copyright:
 * @Describe:
 */
public class EncryptTest {

    @Test
    public void testMD5(){
        try {
            System.out.println(EncryptUtil.SHA_1("123456", GlobalConfig.PASSWORD_SALT));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getSalt(){
        System.out.println(EncryptUtil.getSalt());
    }

}
