package com.sword.admin.request.util;

import com.sword.admin.entity.User;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;



/**
 * @Author zhengzhe
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
public class RequestUtil {
    public static String SESSION_KEY_LOGIN_USER = "USER";
    public static String COOKIE_NAME_AUTO_LOGIN = "ACCOUNTINFO";

    private static Logger logger = LogManager.getLogger(RequestUtil.class);
    /**
     * 根据key获取session值
     * @param request
     * @param key
     * @return
     */
    public static Object getSessionAttribute(HttpServletRequest request, String key){
        return request.getSession().getAttribute(key);
    }

    /**
     * 设置session key-value
     * @param request
     * @param key
     * @param value
     */
    public static void setSessionAttribute(HttpServletRequest request, String key, Object value){
         request.getSession().setAttribute(key,value);
    }


    /**
     * 获取session中登录用户
     * @param request
     * @return
     */
    public static User getLoginUserFromSession(HttpServletRequest request){
        return (User) getSessionAttribute(request,SESSION_KEY_LOGIN_USER);
    }

    /**
     * 获取session中登录用户
     * @param request
     * @return
     */
    public static void setLoginUserToSession(HttpServletRequest request, User user){
         setSessionAttribute(request,SESSION_KEY_LOGIN_USER,user);
    }



    /**
     * 获取Cookie
     * @param request
     * @return
     */
    public static Cookie getCookie(HttpServletRequest request,String name){
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            logger.debug("Request cookie size:" + cookies.length);
            for (Cookie cookie:cookies) {
                logger.debug("cookie name :" + cookie.getName());
                if(cookie.getName().equalsIgnoreCase(name)){
                    return cookie;
                }
            }
        }
        return null;
    }


    /**
     * 获取自动登录cookie
     * @param request
     * @return
     */
    public static Cookie getAutoLoginCookie(HttpServletRequest request){
        return getCookie(request,COOKIE_NAME_AUTO_LOGIN);
    }


    public static boolean isXMLHttpRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
    }
}
