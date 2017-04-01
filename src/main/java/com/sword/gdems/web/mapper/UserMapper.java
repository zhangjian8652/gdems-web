package com.sword.gdems.web.mapper;

import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.response.entity.DataTableUser;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public interface UserMapper extends Mapper<User> {

     List<DataTableUser> getDatableUsers(@Param("searchValue")String searchValue, @Param("offset") int offset, @Param("limit") int limit);

     long getDatableUsersTotalCount(@Param("searchValue")String searchValue);

}
