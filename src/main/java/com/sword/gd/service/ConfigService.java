package com.sword.gd.service;

import com.sword.gd.entity.SubjectConfig;

import java.util.List;

/**
 * Created by Joker on 2017/4/16.
 */
public interface ConfigService {
    SubjectConfig getSubjectConfig() throws Exception;

    boolean updateSubjectConfig(SubjectConfig subjectConfig) throws Exception;

}
