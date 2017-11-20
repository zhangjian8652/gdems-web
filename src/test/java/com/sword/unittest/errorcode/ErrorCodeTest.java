package com.sword.unittest.errorcode;

import com.sword.admin.config.ErrorCodeConfig;
import org.junit.Test;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public class ErrorCodeTest {

    @Test
    public void getErrorMSGByCode(){
        System.out.println(ErrorCodeConfig.getMessage(ErrorCodeConfig.EMAIL_PASSWORD_USER_NOT_FOUND));
    }
}
