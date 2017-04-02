package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.mapper.OrganizationMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
