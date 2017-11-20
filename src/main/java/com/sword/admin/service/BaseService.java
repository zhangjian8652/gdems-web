package com.sword.admin.service;

import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface BaseService<T> {
    DataTablePage<T> page(DatatableCondition condition) throws Exception;

    T entity(T  t) throws Exception;

    List<T> list(T  t) throws Exception;
}
