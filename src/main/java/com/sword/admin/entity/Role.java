/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sword.admin.entity;

import com.sword.admin.entity.common.BaseEntity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Table;
import javax.validation.constraints.Pattern;

/**
 * 角色Entity
 * @author zhengzhe
 * @version 2017-02-22
 */
@Table(name = "sys_role")
public class Role extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	@NotEmpty(message = "角色名必填")
	@Length(min = 2,max = 40,message = "长度必须为{0}到{1}位")
	private String name; 	// 角色名称
	private String englishName;	// 英文名称
	@NotEmpty(message = "角色类型必填")
	@Pattern(regexp = "^NORMAL$",message = "角色类型不正确")
	private String roleType;// 权限类型

	private String dataScope;// 数据范围
	@NotEmpty(message = "角色状态必填")
	@Pattern(regexp = "^ACTIVE|INACTIVE$",message = "激活状态不正确")
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

	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}


}
