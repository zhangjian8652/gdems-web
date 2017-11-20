package com.sword.gd.service.impl;

import com.sword.gd.entity.Config;
import com.sword.gd.entity.SubjectConfig;
import com.sword.gd.mapper.ConfigMapper;
import com.sword.gd.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Joker on 2017/4/16.
 */
@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private ConfigMapper configMapper;

    @Override
    public SubjectConfig getSubjectConfig() throws Exception {
        Config config = new Config();
        config.setType(Config.SUBJECT_TYPE);

        List<Config> configs = configMapper.select(config);

        SubjectConfig subjectConfig = new SubjectConfig();

        for (int i = 0; i < configs.size(); i++) {
            Config config1 = configs.get(i);
            if (Config.SUBJECT_STUDENT_NUM.equalsIgnoreCase(config1.getConfigKey())) {
                subjectConfig.setStudentNum(Integer.parseInt(config1.getConfigValue()));
            }
        }

        return subjectConfig;
    }

    @Override
    public boolean updateSubjectConfig(SubjectConfig subjectConfig) throws Exception {

        Config config = new Config();
        config.setConfigKey(Config.SUBJECT_STUDENT_NUM);
        config.setType(Config.SUBJECT_TYPE);
        config.setConfigValue(subjectConfig.getStudentNum() + "");
        int count = configMapper.updateByPrimaryKey(config);

        return count > 0;
    }
}
