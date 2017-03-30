package com.sword.gdems.web.request.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public class SessionUtil {
    public static String USER_SESSION_PREFIX = "USER_";

    public static String getAttribute(HttpServletRequest request,String key){
        return (String) request.getSession().getAttribute(key);
    }

    public static void setAttribute(HttpServletRequest request,String key,Object value){
         request.getSession().setAttribute(key,value);
    }
}
