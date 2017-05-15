package com.sword.admin.mapper;

import com.sword.admin.entity.Organization;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface OrganizationMapper extends Mapper<Organization> {

    List<Organization> getByUserId(@Param("userId")String id);

    boolean deleteByParentId(String id);
}
