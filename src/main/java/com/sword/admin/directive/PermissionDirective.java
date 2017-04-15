package com.sword.admin.directive;

import com.sword.admin.common.directive.DirectiveUtils;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.service.PermissionService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public class PermissionDirective extends AbstractDirective<Object> {

    private Logger logger = LogManager.getLogger(PermissionDirective.class);
    @Autowired
    private PermissionService permissionService;

    @Override
    protected boolean isOk(Map map) throws Exception {

        String permission = DirectiveUtils.getString("permission",map);
        String userId = DirectiveUtils.getString("userId", map);

        //如果permission或者userID为空 直接返回false
        if (StringUtils.isEmpty(permission) || StringUtils.isEmpty(userId)) {
            return false;
        }

        boolean result = permissionService.hasPermission(permission, userId);

        logger.debug("check permission result [" + permission + ":" + result + "]");
        return result;
    }

    @Override
    protected DataTablePage<Object> page(Map map) throws Exception {
        return null;
    }

    @Override
    protected List<Object> list(Map map) throws Exception {
        return null;
    }

    @Override
    protected Object entity(Map map) throws Exception {
        return null;
    }
}
