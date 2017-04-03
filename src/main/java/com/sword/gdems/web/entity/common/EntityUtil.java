package com.sword.gdems.web.entity.common;

import com.sword.gdems.web.entity.User;

import java.util.Date;

/**
 * Created by Joker on 2017/4/3.
 */
public class EntityUtil {

    public static void setCommonValue(BaseEntity entity,User user){
        entity.setCreateBy(user.getLoginName());
        entity.setCreateDate(new Date());
        entity.setUpdateBy(user.getLoginName());
        entity.setUpdateDate(new Date());
        entity.setDelFlag(BaseEntity.DEL_FLAG_NORMAL);
        return;
    }
}
