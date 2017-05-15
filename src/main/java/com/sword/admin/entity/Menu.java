/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sword.admin.entity;


import com.sword.admin.entity.common.BaseEntity;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Table;

/**
 * 菜单Entity
 * @author zhengzhe
 * @version 2017-02-22
 */
@Table(name = "sys_menu")
public class Menu extends BaseEntity {

	private static final long serialVersionUID = 1L;
	private String parentId;	// 父级菜单

	@NotEmpty
	private String name; 	// 名称
	private String href; 	// 链接
	private String target; 	// 目标（ mainFrame、_blank、_self、_parent、_top）
	private String icon; 	// 图标
	private Integer sort; 	// 排序
	@NotEmpty
	private String isShow; 	// 是否在菜单中显示（1：显示；0：不显示）
	@NotEmpty
	private String permission; // 权限标识
	private String isParent; // 权限标识

	public static String IS_PARENT = "YES";
	public static String IS_NOT_PARENT = "NO";
	public static String NONE_PARENT_ID = "NO";
	public static String IS_SHOW = "0";
	public static String IS_HIDE = "1";

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
}