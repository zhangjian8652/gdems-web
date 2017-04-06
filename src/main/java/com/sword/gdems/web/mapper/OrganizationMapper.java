package com.sword.gdems.web.mapper;

import com.sword.gdems.web.entity.Organization;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface OrganizationMapper extends Mapper<Organization> {

    List<Organization> getByUserId(@Param("userId")String id);

    boolean deleteByParentId(String id);
}
