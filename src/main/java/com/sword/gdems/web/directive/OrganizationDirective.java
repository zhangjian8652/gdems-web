package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.entity.Organization;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.OrganizationService;
import org.apache.log4j.LogManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public class OrganizationDirective extends AbstractDirective<Organization> {

    private static Logger logger = LogManager.getLogger(OrganizationDirective.class);

    @Autowired
    private OrganizationService organizationService;

    @Override
    protected boolean isOk(Map map) {
        return false;
    }

    @Override
    protected DataTablePage<Organization> page(Map map) throws Exception {
        return null;
    }

    @Override
    protected List<Organization> list(Map map) throws Exception {
        return null;
    }

    @Override
    protected Organization entity(Map map) throws Exception {

        String id = DirectiveUtils.getString("id", map);

        if (StringUtils.isEmpty(id)) {
            return null;
        }

        Organization organization = new Organization();
        organization.setId(id);

        return organizationService.entity(organization);
    }
}
