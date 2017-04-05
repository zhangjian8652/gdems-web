/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sword.gdems.web.entity;


import com.sword.gdems.web.entity.common.BaseEntity;
import freemarker.template.TemplateModel;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Table;

/**
 * 机构Entity
 * @author zhangjian
 * @version 2017-02-22
 */
@Table(name = "sys_organization")
public class Organization extends BaseEntity implements TemplateModel{

	private static final long serialVersionUID = 1L;

	private String parentId;	// 父级编号
	private String areaId;		// 归属区域
	private String code; 	// 机构编码

	@NotEmpty(message = "机构名称不能为空")
	private String name; 	// 机构名称
	private Integer sort;		// 排序

	@NotEmpty(message = "机构类型不能为空")
	private String type; 	// 机构类型（1：公司；2：部门；3：小组）
	private String grade; 	// 机构等级（1：一级；2：二级；3：三级；4：四级）
	private String address; // 联系地址
	private String zipCode; // 邮政编码
	private String master; 	// 负责人
	private String phone; 	// 电话
	private String fax; 	// 传真
	private String email; 	// 邮箱
	private String useable;//是否可用
	private String primaryPersonId;//主负责人
	private String deputyPersonId;//副负责人

	public static String NON_PARENT = "NO";


	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getPrimaryPersonId() {
		return primaryPersonId;
	}

	public void setPrimaryPersonId(String primaryPersonId) {
		this.primaryPersonId = primaryPersonId;
	}

	public String getDeputyPersonId() {
		return deputyPersonId;
	}

	public void setDeputyPersonId(String deputyPersonId) {
		this.deputyPersonId = deputyPersonId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Organization{" +
				"parentId='" + parentId + '\'' +
				", areaId='" + areaId + '\'' +
				", code='" + code + '\'' +
				", name='" + name + '\'' +
				", sort=" + sort +
				", type='" + type + '\'' +
				", grade='" + grade + '\'' +
				", address='" + address + '\'' +
				", zipCode='" + zipCode + '\'' +
				", master='" + master + '\'' +
				", phone='" + phone + '\'' +
				", fax='" + fax + '\'' +
				", email='" + email + '\'' +
				", useable='" + useable + '\'' +
				", primaryPersonId='" + primaryPersonId + '\'' +
				", deputyPersonId='" + deputyPersonId + '\'' +
				'}';
	}
}