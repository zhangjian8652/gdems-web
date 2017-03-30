/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sword.gdems.web.entity;

import com.sword.gdems.web.entity.common.BaseEntity;

/**
 * 角色Entity
 * @author zhangjian
 * @version 2017-02-22
 */
public class Role extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	private String name; 	// 角色名称
	private String englishName;	// 英文名称
	private String roleType;// 权限类型
	private String dataScope;// 数据范围

	private String oldName; 	// 原角色名称
	private String oldEnname;	// 原英文名称
	private String useable; 		//是否是可用



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getDataScope() {
		return dataScope;
	}

	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}

	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public String getOldEnname() {
		return oldEnname;
	}

	public void setOldEnname(String oldEnname) {
		this.oldEnname = oldEnname;
	}


	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}


}
