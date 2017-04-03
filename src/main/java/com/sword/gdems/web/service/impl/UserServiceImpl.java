package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.mapper.UserMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.UserService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public DataTablePage<User> page(DatatableCondition condition) throws Exception {
        /**
         * 此处查询条件给控制器处理，这里要求必须传递
         */
        if (StringUtils.isEmpty(condition.getDraw()) || StringUtils.isEmpty(condition.getStart())  || StringUtils.isEmpty(condition.getLength())) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        /**
         * 增加like条件查询
         */
        Example example = new Example(User.class);

        if(!StringUtils.isEmpty(condition.getSearchValue())){
            example.or().andLike("loginName", "%" + condition.getSearchValue() + "%");
            example.or().andLike("mobile", "%" + condition.getSearchValue() + "%");
            example.or().andLike("email", "%" + condition.getSearchValue() + "%");
        }

        /**
         * 按照创建日期排序
         */
        example.orderBy("createDate").desc();

        /**
         * 分页条件
         */
        RowBounds rowBounds = new RowBounds(condition.getStart(), condition.getLength());

        /**
         * 查询满足条件的用户数据以及总数
         */
        List<User> users = userMapper.selectByExampleAndRowBounds(example, rowBounds);
        long count = userMapper.selectCountByExample(example);

        DataTablePage<User> dataTablePage = new DataTablePage<User>(condition.getDraw(), count, count, users);

        return dataTablePage;
    }

    @Override
    public User entity(User user) throws Exception {
        return userMapper.selectOne(user);
    }

    @Override
    public List<User> list(User user) throws Exception {
        return userMapper.select(user);
    }

    @Override
    public boolean exist(String loginName) {
        User user = new User();
        user.setLoginName(loginName);
        List<User> users = userMapper.select(user);
        if(users == null || users.size() <=0) {
            return false;
        }
        return true;
    }
}
