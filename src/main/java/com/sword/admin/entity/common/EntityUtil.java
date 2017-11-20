package com.sword.admin.entity.common;

import com.sword.admin.entity.User;

import java.util.Date;

/**
 * Created by Joker on 2017/4/3.
 */
public class EntityUtil {

    public static void setCommonValue(BaseEntity entity,User user){
        entity.setCreateBy(user.getId());
        entity.setCreateDate(new Date());
        entity.setUpdateBy(user.getId());
        entity.setUpdateDate(new Date());
        entity.setDelFlag(BaseEntity.DEL_FLAG_NORMAL);
        return;
    }

    public static void setCommonUpdateValue(BaseEntity entity, User user) {
        entity.setUpdateBy(user.getId());
        entity.setUpdateDate(new Date());
        return;
    }
}
