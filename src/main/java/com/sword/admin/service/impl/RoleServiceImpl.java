package com.sword.admin.service.impl;

import com.sword.admin.config.ErrorCodeConfig;
import com.sword.admin.entity.*;
import com.sword.admin.exception.SwordException;
import com.sword.admin.service.RoleService;
import com.sword.admin.exception.InvalidRequestException;
import com.sword.admin.mapper.MenuMapper;
import com.sword.admin.mapper.RoleMapper;
import com.sword.admin.request.entity.DatatableCondition;
import com.sword.admin.response.DataTablePage;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.LinkedList;
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
        if (StringUtils.isEmpty(condition.getDraw()) || StringUtils.isEmpty(condition.getStart()) || StringUtils.isEmpty(condition.getLength())) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        /**
         * 增加like条件查询
         */
        Example example = new Example(User.class);

        if (!StringUtils.isEmpty(condition.getSearchValue())) {
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
        if (roles == null || roles.size() <= 0) {
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

        boolean result = roleMapper.insert(role) > 0;

        logger.info("add role resullt :" + result);
        if (!result) {
            throw new SwordException(ErrorCodeConfig.INTERNAL_ERROR, "add role failed,pls check role params");
        }

        if (permissions.size() == 0) {
            return true;
        }

        logger.info("start add role permissions :" + result);
        List<RoleMenu> roleMenus = new ArrayList();


       // List<Menu> menus = getAddMenusByPermissions(permissions); 没办法解决用户不打开选项，原来拥有权限问题
        List<Menu> menus = getPermissionMenus(permissions);

        for (int i = 0; i < menus.size(); i++) {
            Menu menu = menus.get(i);
            RoleMenu rm = new RoleMenu(menu.getId(), role.getId());
            roleMenus.add(rm);
        }

        result = roleMapper.insertRoleMenuBatch(roleMenus) > 0;

        logger.info("end add role permissions :" + result);

        if (!result) {
            throw new SwordException(ErrorCodeConfig.INTERNAL_ERROR, "add role permissions failed,pls check role permission params");
        }

        return result;
    }

    @Override
    public Role getById(String id) throws Exception {
        Role role = new Role();
        role.setId(id);
        role = roleMapper.selectByPrimaryKey(role);
        return role;
    }

    @Override
    @Transactional
    public boolean update(Role role, List<ZTreeNode> zTreeNodes) throws Exception {

        //将role更新
        Role role1 = roleMapper.selectByPrimaryKey(role);
        role1.setName(role.getName());
        role1.setUseable(role.getUseable());
        role1.setUpdateDate(role.getUpdateDate());
        role1.setUpdateBy(role.getUpdateBy());
        role1.setRoleType(role.getRoleType());
        role1.setEnglishName(role.getEnglishName());
        roleMapper.updateByPrimaryKey(role1);

        //将原来得权限删除
        roleMapper.deleteRoleMenuByRoleId(role1.getId());

        //插入新得权限
        List<RoleMenu> roleMenus = new ArrayList();
       // List<Menu> menus = getAddMenusByPermissions(zTreeNodes); 没办法解决用户不打开选项，原来拥有权限问题
        List<Menu> menus = getPermissionMenus(zTreeNodes);

        for (int i = 0; i < menus.size(); i++) {
            Menu menu = menus.get(i);
            RoleMenu rm = new RoleMenu(menu.getId(), role.getId());
            roleMenus.add(rm);
        }

        boolean result = roleMapper.insertRoleMenuBatch(roleMenus) > 0;
        return result;
    }

    @Override
    @Transactional
    public boolean delete(Role role) throws Exception {
        boolean result = false;
        result = roleMapper.deleteByPrimaryKey(role) > 0;
        roleMapper.deleteRoleMenuByRoleId(role.getId());

        return result;
    }

    private List<Menu> getChildren(List<Menu> pMenus) {

        List<Menu> menus = new ArrayList<Menu>();

        //将所有子菜单读出来放入menus
        for (int i = 0; i < pMenus.size(); i++) {
            Menu pmennu = pMenus.get(i);
            Menu cmenu = new Menu();
            cmenu.setParentId(pmennu.getId());
            List<Menu> tMenus = menuMapper.select(cmenu);
            menus.addAll(tMenus);
        }

        //将所有子菜单的子菜单读处来放入menus
        if (menus.size() > 0) {
            List<Menu> cMenus = getChildren(menus);
            menus.addAll(cMenus);
        }

        return menus;
    }


    private List<Menu> getAddMenusByPermissions(List<ZTreeNode> zTreeNodes) {

        List<Menu> permissionMenus = getPermissionMenus(zTreeNodes);

        List<Menu> resultMenus = new ArrayList<Menu>();

        for (int i = 0; i < permissionMenus.size(); i++) {
            Menu menu = permissionMenus.get(i);
            resultMenus.add(menu);
            if (Menu.IS_PARENT.equalsIgnoreCase(menu.getIsParent())) {
                boolean hasChildren = hasChilren(permissionMenus, menu);
                if (!hasChildren) {
                    resultMenus.addAll(getChilren(menu));
                }
            }
        }

        return resultMenus;
    }

    public List<Menu> getChilren(Menu menu) {

        Menu menu1 = new Menu();
        menu1.setParentId(menu.getId());
        return menuMapper.select(menu1);
    }

    private boolean hasChilren(List<Menu> permissionMenus, Menu menu) {

        for (int i = 0; i < permissionMenus.size(); i++) {
            Menu menu1 = permissionMenus.get(i);
            if (menu1.getParentId().equalsIgnoreCase(menu.getId())) {
                return true;
            }
        }
        return false;
    }

    private List<Menu> getPermissionMenus(List<ZTreeNode> zTreeNodes) {
        List<String> menuIds = new LinkedList<String>();
        for (int i = 0; i < zTreeNodes.size(); i++) {
            ZTreeNode zTreeNode = zTreeNodes.get(i);
            menuIds.add(zTreeNode.getId());
        }

        Example example = new Example(Menu.class);
        example.createCriteria().andIn("id", menuIds);
        return menuMapper.selectByExample(example);
    }
}
