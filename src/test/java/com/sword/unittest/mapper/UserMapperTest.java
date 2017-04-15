package com.sword.unittest.mapper;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sword.admin.entity.User;
import com.sword.admin.mapper.UserMapper;
import com.sword.unittest.common.SpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.NoSuchAlgorithmException;
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
    public void testSelectOne() throws NoSuchAlgorithmException {
        User user = new User();
        user.setLoginName("zhangjian");
        user.setPassword("31ace546d14f7add7423867cbb6bc87a5e7bcc7e");
        User user1 = userMapper.selectOne(user);
        System.out.println(user1.toString());
    }

    @Test
    public void testSelectList() throws NoSuchAlgorithmException {
        User user = new User();
        user.setLoginName("zhangjian");
        List<User> users = userMapper.select(user);
        System.out.println(users.toString());
    }


    @Test
    public void testDelete() {
        User user = new User();
        user.setId("4");
        System.out.println(userMapper.deleteByPrimaryKey(user));
    }


}
