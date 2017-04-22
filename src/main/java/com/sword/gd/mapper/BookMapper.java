package com.sword.gd.mapper;

import com.sword.gd.entity.TaskBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2017/4/22.
 */
public interface BookMapper {
    List<TaskBook> taskbookPage(@Param("userId") String userId, @Param("offset") int offset, @Param("limit") int limit);
}
