package com.sword.gd.entity;


import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Joker on 2017/4/16.
 */
@Table(name = "gd_config")
public class Config {

    @Id
    private String type;
    @Id
    private String configKey;
    private String configValue;



    public static String SUBJECT_TYPE = "SUBJECT";
    public static String SUBJECT_STUDENT_NUM = "STUDENT_NUM";


    public String getConfigKey() {
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
