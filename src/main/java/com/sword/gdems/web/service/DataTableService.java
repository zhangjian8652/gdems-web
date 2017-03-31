package com.sword.gdems.web.service;

import com.sword.gdems.web.response.entity.DataTableUser;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
public interface DataTableService {
    List<DataTableUser> findList(DataTableUser schoolUser, int offset, int limit) throws Exception;
}
