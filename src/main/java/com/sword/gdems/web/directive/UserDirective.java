package com.sword.gdems.web.directive;

import com.sword.gdems.common.directive.DirectiveUtils;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.UserService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Joker on 2017/4/2.
 */
public class UserDirective extends AbstractDirective<User> {

    @Autowired
    private UserService userService;

    private Logger logger = LogManager.getLogger(UserDirective.class);

    @Override
    protected boolean isOk(Map map) {
        return false;
    }

    @Override
    protected DataTablePage<User> page(Map map) throws Exception {

        String searchValue =  DirectiveUtils.getString("searchValue", map);
        int offset =  DirectiveUtils.getInt("offset", map);
        int limit =  DirectiveUtils.getInt("limit", map);
        int draw =  DirectiveUtils.getInt("draw", map);

        DatatableCondition condition = new DatatableCondition(offset, limit, searchValue, draw);

        return userService.page(condition);
    }

    @Override
    protected List<User> list(Map map) throws Exception{
        return userService.all();
    }

    @Override
    protected User entity(Map map) throws Exception{
        String userId =  DirectiveUtils.getString("userId", map);
        logger.info("Directive to entity userId is ：" + userId);

        if (StringUtils.isEmpty(userId)) {
            return null;
        }
        User user = new User();
        user.setId(userId);

        return userService.entity(user);
    }
}
