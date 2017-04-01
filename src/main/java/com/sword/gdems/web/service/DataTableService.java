package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Page;
import com.sword.gdems.web.response.entity.DataTableUser;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
public interface DataTableService {
    /**
     * data table 分页数据查询
     * @param searchValue
     * @param offset
     * @param limit
     * @return
     * @throws Exception
     */
    Page<DataTableUser> findList(String searchValue, int offset, int limit) throws Exception;

}
