package com.sword.gdems.web.config;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.Properties;

/**
 * @Author zhangjian
 * @Date 2017/3/30
 * @Copyright:
 * @Describe:
 */
public class GlobalConfig {
    public static String PASSWORD_SALT = "GDEMS";

    private static Properties configProperties;
    private static Logger logger = LogManager.getLogger(ErrorCodeConfig.class);

    static {
        configProperties = new Properties();
        try {
            configProperties.load(ErrorCodeConfig.class.getClassLoader().getResourceAsStream("web-config.properties"));
        } catch (IOException e) {
            logger.warn("error-code.properties not found in classpath.");
        }

    }

    public static String getConfig(String key) {
        return configProperties.getProperty(key);
    }

}
