package com.sword.admin.service.impl;

import com.sword.admin.common.encrypt.util.EncryptUtil;
import com.sword.admin.config.ErrorCodeConfig;
import com.sword.admin.config.GlobalConfig;
import com.sword.admin.entity.Organization;
import com.sword.admin.entity.Role;
import com.sword.admin.entity.User;
import com.sword.admin.entity.UserRole;
import com.sword.admin.exception.SwordException;
import com.sword.admin.mapper.OrganizationMapper;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.mapper.RoleMapper;
import com.sword.admin.mapper.UserMapper;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import com.sword.admin.service.UserService;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.List;


/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class UserServiceImpl implements UserService {

    private static Logger logger = LogManager.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private OrganizationMapper organizationMapper;

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

    @Override
    public List<User> all() throws Exception {
        return userMapper.selectAll();
    }

    @Override
    public boolean save(User user) throws Exception {
        user.setPassword(EncryptUtil.SHA_1(user.getPassword(), GlobalConfig.PASSWORD_SALT));
        return userMapper.insert(user) > 0;
    }

    @Override
    @Transactional
    public boolean save(User user, String roleId) throws Exception {

        if (!StringUtils.isEmpty(user.getDepartmentId()) && !"NONE".equalsIgnoreCase(user.getDepartmentId())) {
            Organization department = new Organization();
            department.setId(user.getDepartmentId());
            Organization departmentFromDB = organizationMapper.selectByPrimaryKey(department);
            if (departmentFromDB == null) {
                throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "学院不存在，找不到。");
            }
        }else {
            user.setDepartmentId(null);
        }

        if (!StringUtils.isEmpty(user.getMajorId())) {
            Organization major = new Organization();
            major.setId(user.getMajorId());
            Organization majorFromDB = organizationMapper.selectByPrimaryKey(major);
            if (majorFromDB == null) {
                throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "专业不存在，找不到。");
            }
        }else {
            user.setMajorId(null);
        }

        user.setPassword(EncryptUtil.SHA_1(user.getPassword(), GlobalConfig.PASSWORD_SALT));
       int count =  userMapper.insert(user);

        if (!StringUtils.isEmpty(roleId)) {
            Role role = new Role();
            role.setId(roleId);
            Role roleFromDB = roleMapper.selectByPrimaryKey(role);
            if (roleFromDB == null) {
                throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "角色不存在，找不到。");
            }else {
                UserRole userRole = new UserRole(user.getId(), roleId);
                 count = userMapper.insertUserRole(userRole);
                if (count <= 0) {
                    throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "添加角色失败，请联系管理员。");
                }
            }
        }


        if (count <= 0) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "添加用户失败，请联系管理员。");
        }

        return true;
    }

    @Override
    public boolean deleteById(String id) throws Exception {
        User user = new User();
        user.setId(id);
        int result = userMapper.deleteByPrimaryKey(user);
        return result > 0;
    }

    @Override
    public User getUserById(String id) throws Exception {
        User user = new User();
        user.setId(id);
        User result = userMapper.selectByPrimaryKey(user);
        logger.debug("get user by id : " + result.toString());
        return result;
    }

    @Override
    @Transactional
    public boolean updateUser(User userFromDB,String roleId) throws Exception {

        if (!StringUtils.isEmpty(roleId)) {
            Role role = new Role();
            role.setId(roleId);
            Role roleFromDB = roleMapper.selectByPrimaryKey(role);
            if (roleFromDB == null) {
                throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "更新角色不存在，找不到。");
            }else {
                UserRole userRole = new UserRole(userFromDB.getId(),roleFromDB.getId());
              int  count = userMapper.updateUserRole(userRole);
                if (count <= 0) {
                    throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "更新角色失败，请联系管理员。");
                }
            }
        }

        int result = userMapper.updateByPrimaryKey(userFromDB);
        logger.debug("update user info result:" + result);
        return result > 0;
    }

    @Override
    public List<User> getUserByRoleName(String roleName) throws Exception {
        return userMapper.getByRoleName(roleName);
    }
}
