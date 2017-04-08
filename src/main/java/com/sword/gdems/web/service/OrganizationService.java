package com.sword.gdems.web.service;

import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.entity.Organization;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
public interface OrganizationService extends BaseService<Organization> {
    List<Organization> list() throws Exception;

    List<Organization> getTop() throws Exception;

    List<Organization> getByParentId(String parentId) throws Exception;

    boolean save(Organization organization) throws Exception;

    boolean exist(String name) throws Exception;

    Organization getById(String id)  throws Exception;

    List<Organization> getByUserId(String id) throws Exception;

    boolean delete(String id) throws Exception;

    List<Organization> getByType(String type) throws Exception;
}
