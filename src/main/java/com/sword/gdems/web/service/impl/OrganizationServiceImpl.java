package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.mapper.OrganizationMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {


    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public DataTablePage<Organization> page(DatatableCondition condition) throws Exception {
        return null;
    }

    @Override
    public Organization entity(Organization organization) throws Exception {
        return organizationMapper.selectOne(organization);
    }

    @Override
    public List<Organization> list(Organization organization) throws Exception {
        return organizationMapper.select(organization);
    }

    @Override
    public List<Organization> list() throws Exception {
        Example example = new Example(Organization.class);
        example.orderBy("createDate").desc();
        return organizationMapper.selectByExample(example);
    }

    @Override
    public List<Organization> getTop() throws Exception {
        Organization organization = new Organization();


        organization.setParentId(Organization.NON_PARENT);
        return organizationMapper.select(organization);
    }

    @Override
    public List<Organization> getByParentId(String parentId) throws Exception {

        //如果父菜单id位空则查顶级菜单
        if (StringUtils.isEmpty(parentId)) {
            return getTop();
        }

        //否则查出所有对应子集菜单
        Organization organization = new Organization();
        organization.setParentId(parentId);
        return organizationMapper.select(organization);

    }

    @Override
    public boolean save(Organization organization) throws Exception {
        return organizationMapper.insert(organization) > 0;
    }

    @Override
    public boolean exist(Organization organization1) throws Exception {
        return organizationMapper.selectOne(organization1) != null;
    }

    @Override
    public Organization getById(String id) throws Exception {
        Organization organization = new Organization();
        organization.setId(id);

        return organizationMapper.selectByPrimaryKey(organization);
    }

}
