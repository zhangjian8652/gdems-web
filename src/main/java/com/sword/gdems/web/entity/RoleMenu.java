package com.sword.gdems.web.entity;

import javax.persistence.Table;

/**
 * Created by Joker on 2017/4/4.
 */
@Table(name = "sys_role_menu")
public class RoleMenu {
    private String menuId;
    private String roleId;

    public RoleMenu() {
    }

    public RoleMenu(String menuId, String roleId) {
        this.menuId = menuId;
        this.roleId = roleId;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
