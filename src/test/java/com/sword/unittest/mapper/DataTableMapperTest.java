package com.sword.unittest.mapper;


import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.mapper.UserMapper;
import com.sword.gdems.web.response.entity.DataTableUser;
import com.sword.unittest.common.SpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
public class DataTableMapperTest extends SpringTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Test
    public void testDataTableUser(){

      List<DataTableUser> userList =  userMapper.getDatableUsers(null,0,10);

        for (int i = 0; i < userList.size(); i++) {
            DataTableUser tableUser = userList.get(i);
            String userId = tableUser.getId();
            List<Role> roles = roleMapper.getByUserId(userId);
            StringBuilder roleNames = new StringBuilder();
            for (Role role : roles) {
                roleNames.append(role.getName());
            }
            //获取角色的所有名字符串返回
            tableUser.setRoleNames(roleNames.toString());
        }

        for (DataTableUser dataTableUser : userList) {

            System.out.println(dataTableUser.getRoleNames());
        }
        
    }
}
