/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.sword.admin.entity;

import java.util.List;

/**
 * 分页类
 * @author ThinkGem
 * @version 2013-7-2
 * @param <T>
 */
public class Page<T> {

	private long count;// 总记录数，设置为“-1”表示不查询总数
	private List<T> datas;


	public Page() {
	}

	public Page(long count, List<T> datas) {
		this.count = count;
		this.datas = datas;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
}
