package com.sword.admin.service.impl;

import com.sword.admin.entity.Organization;
import com.sword.admin.mapper.OrganizationMapper;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.service.OrganizationService;
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
    public boolean exist(String name) throws Exception {

        Organization organization = new Organization();
        organization.setName(name);
        return organizationMapper.selectOne(organization) != null;
    }

    @Override
    public Organization getById(String id) throws Exception {
        Organization organization = new Organization();
        organization.setId(id);

        return organizationMapper.selectByPrimaryKey(organization);
    }

    @Override
    public List<Organization> getByUserId(String id) throws Exception {

        return organizationMapper.getByUserId(id);
    }

    @Override
    public boolean delete(String id) throws Exception {
        Example example = new Example(Organization.class);
        example.or().andEqualTo("id", id);
        example.or().andEqualTo("parentId", id);
        int result = organizationMapper.deleteByExample(example);
        return result > 0;
    }

    @Override
    public List<Organization> getByType(String type) throws Exception {
        Organization organization = new Organization();
        organization.setType(type);
        return organizationMapper.select(organization);
    }

}
