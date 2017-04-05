package com.sword.gdems.web.service.impl;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.*;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.SwordException;
import com.sword.gdems.web.mapper.MenuMapper;
import com.sword.gdems.web.mapper.RoleMapper;
import com.sword.gdems.web.request.entity.DatatableCondition;
import com.sword.gdems.web.response.DataTablePage;
import com.sword.gdems.web.service.RoleService;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joker on 2017/4/2.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    private static Logger logger = LogManager.getLogger(RoleServiceImpl.class);

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

    @Override
    @Transactional
    public boolean add(Role role, List<ZTreeNode> permissions) throws Exception {

        boolean result =  roleMapper.insert(role) > 0;

        logger.info("add role resullt :" + result);
        if(!result){
            throw new SwordException(ErrorCodeConfig.INTERNAL_ERROR,"add role failed,pls check role params");
        }

        logger.info("start add role permissions :"  + result);
        List<RoleMenu> roleMenus = new ArrayList();
        for (int i = 0; i < permissions.size(); i++) {
            ZTreeNode zTreeNode = permissions.get(i);
            //如果该节点已经打开则添加用户选择的节点
            RoleMenu roleMenu = new RoleMenu(zTreeNode.getId(), role.getId());
            roleMenus.add(roleMenu);
            if (!zTreeNode.isOpen()) {
                //如果没有打开，则默认勾选所子节点
                addChildrenNodes(roleMenus, zTreeNode.getId(), role.getId());
            }
        }
        result = roleMapper.insertRoleMenuBatch(roleMenus) >0;

        logger.info("end add role permissions :"  + result);

        if (!result) {
            throw new SwordException(ErrorCodeConfig.INTERNAL_ERROR,"add role permissions failed,pls check role permission params");
        }

        return result;
    }

    private void addChildrenNodes(List<RoleMenu> roleMenus, String menuId,String roleId) {

        Menu menu = new Menu();
        menu.setParentId(menuId);
        List<Menu> menus = menuMapper.select(menu);

        //如果子菜单为空,则直接放回不做操作
        if (menus == null || menus.size() == 0) {
            return;
        }

        //如果子菜单权限部位空，则加给角色，并继续添加子菜单的子菜单
        for (int i = 0; i < menus.size(); i++) {
            Menu menu1 = menus.get(i);
            RoleMenu roleMenu = new RoleMenu(menu1.getId(),roleId);
            roleMenus.add(roleMenu);
            addChildrenNodes(roleMenus,menu1.getId(),roleId);
        }

    }
}
