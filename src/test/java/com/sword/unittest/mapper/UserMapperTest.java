package com.sword.unittest.mapper;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.mapper.UserMapper;
import com.sword.unittest.common.SpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public class UserMapperTest extends SpringTest{

    @Autowired
    private UserMapper userMapper;


    @Test
    public void testSelectAll(){
        List<User> users = userMapper.selectAll();
        System.out.println(users.toString());
    }


    @Test
    public void testSelectPage(){
        PageHelper.startPage(0,5);
        List<User> users = userMapper.selectAll();
        PageInfo<User> page = new PageInfo(users);
        System.out.println(page.getList().size());
    }



    @Test
    public void testSelectOne(){
        User user = new User();
        user.setLoginName("zhangjian");
        User user1 = userMapper.selectOne(user);
        System.out.println(user1.toString());
    }

}
