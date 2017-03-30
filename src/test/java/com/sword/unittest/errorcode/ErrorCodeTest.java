package com.sword.unittest.errorcode;

import com.sword.gdems.web.config.ErrorCodeConfig;
import org.junit.Test;

/**
 * @Author zhangjian
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
