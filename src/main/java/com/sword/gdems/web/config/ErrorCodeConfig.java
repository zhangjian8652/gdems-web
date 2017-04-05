package com.sword.gdems.web.config;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.Properties;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public class ErrorCodeConfig {

    private static Properties errorCodeProperties;
    private static Logger logger = LogManager.getLogger(ErrorCodeConfig.class);



    static {
        errorCodeProperties = new Properties();
        try {
            errorCodeProperties.load(ErrorCodeConfig.class.getClassLoader().getResourceAsStream("error-code.properties"));
        } catch (IOException e) {
            logger.warn("error-code.properties not found in classpath.");
        }

    }


    public static String getMessage(String errorCode) {
        return errorCodeProperties.getProperty(errorCode);
    }


    public static String SUCCESS = "100000";
    public static String USERNAME_PASSWORD_NOT_FOUND = "100011";
    public static String EMAIL_PASSWORD_USER_NOT_FOUND = "100012";
    public static String USERNAME_OR_EMAIL_PASSWORD_USER_NOT_FOUND = "100013";
    public static String REUQUEST_CONDIRION_ERROR = "100018";
    public static String INTERNAL_ERROR = "500";
    public static String NOT_AUTHORIZED = "403";
    public static String ROLENAME_ALREADY_EXIST = "100019";


}
