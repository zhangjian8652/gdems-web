package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Role;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.RoleService;
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
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataTablePage<Role> page(DatatableCondition condition) throws Exception {
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
            example.or().andLike("name", "%" + condition.getSearchValue() + "%");
            example.or().andLike("englishName", "%" + condition.getSearchValue() + "%");
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
        List<Role> users = roleMapper.selectByExampleAndRowBounds(example, rowBounds);
        long count = roleMapper.selectCountByExample(example);

        DataTablePage<Role> dataTablePage = new DataTablePage<Role>(condition.getDraw(), count, count, users);

        return dataTablePage;
    }

    @Override
    public Role entity(Role role) throws Exception {
        return roleMapper.selectOne(role);
    }

    @Override
    public List<Role> list(Role role) throws Exception {
        return roleMapper.select(role);
    }

    @Override
    public List<Role> getByUserId(String userId) throws Exception {
        return roleMapper.getByUserId(userId);
    }

    @Override
    public boolean exist(String name) {
        Role role = new Role();
        role.setName(name);
        List<Role> roles = roleMapper.select(role);
        if(roles == null || roles.size() <=0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean save(Role role) {
        return roleMapper.insert(role) > 0;
    }
}
