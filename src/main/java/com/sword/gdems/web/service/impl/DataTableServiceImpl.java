package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.entity.Page;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.mapper.UserMapper;
import com.sword.gdems.web.response.entity.DataTableUser;
import com.sword.gdems.web.service.DataTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Service
public class DataTableServiceImpl implements DataTableService {


    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Page<DataTableUser> findList(String searchValue, int offset, int limit) throws Exception {

        List<DataTableUser> dataTableUsers = userMapper.getDatableUsers(searchValue, offset, limit);

        for (DataTableUser datatableUser : dataTableUsers) {
            datatableUser.setRoleNames(rolesString(datatableUser.getId()));
        }

        Page<DataTableUser> page = new Page<DataTableUser>();
        page.setDatas(dataTableUsers);
        page.setCount(userMapper.getDatableUsersTotalCount(searchValue));

        return page;
    }

    private String rolesString(String userId) {

        //用于分割角色符号
        String spliter = ",";

        if (StringUtils.isEmpty(userId)) {
            return "";
        }

        List<Role> roles = roleMapper.getRolesByUserId(userId);

        if(roles == null || roles.size() ==0){
            return "";
        }
        //拼接字符串以spliter隔开
        StringBuilder roleNames = new StringBuilder();
        for (int i = 0; i < roles.size(); i++) {
            Role role = roles.get(i);
            roleNames.append(role.getName());
            if (i < roles.size() - 1){
                roleNames.append(spliter);
            }
        }

        return roleNames.toString();
    }


}
