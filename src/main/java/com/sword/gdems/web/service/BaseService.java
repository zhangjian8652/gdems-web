package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface BaseService<T> {
    DataTablePage<T> page(DatatableCondition condition) throws Exception;

    T entity(T  t) throws Exception;

    List<T> list(T  t) throws Exception;
}