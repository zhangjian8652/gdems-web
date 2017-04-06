package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.entity.Menu;
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

        //如果时查询所有菜单节点则查询返回所有菜单节点
        String queryAll =  DirectiveUtils.getString("all", map);
        List<Organization> OrganizationList;
        if (!StringUtils.isEmpty(queryAll) && "YES".equalsIgnoreCase(queryAll)) {
            OrganizationList = organizationService.list();
            return OrganizationList;
        }

        //如果不是就根据父ID查询
        String parentId =  DirectiveUtils.getString("parentId", map);

        //如果父id为空则返回顶级
        if (StringUtils.isEmpty(parentId)) {
            OrganizationList =   organizationService.getTop();
        }else {
            //否者才根据父节点查询
            OrganizationList =  organizationService.getByParentId(parentId);
        }

        return OrganizationList;
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
