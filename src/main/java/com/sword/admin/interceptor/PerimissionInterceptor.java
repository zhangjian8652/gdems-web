package com.sword.admin.interceptor;

import com.sword.admin.entity.Menu;
import com.sword.admin.request.util.RequestUtil;
import com.sword.admin.service.MenuService;
import com.sword.admin.entity.User;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Joker on 2017/4/12.
 */
public class PerimissionInterceptor implements HandlerInterceptor {

    @Autowired
    private MenuService menuService;

    private Logger logger = LogManager.getLogger(PerimissionInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        User user = RequestUtil.getLoginUserFromSession(httpServletRequest);

        if (user == null) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/");
        }

        List<Menu> menus = menuService.getAll();
        List<Menu> userMenus = menuService.getByUserId(user.getId());

        String uri = httpServletRequest.getRequestURI();

        boolean isInMenu = false;

        for (int i = 0; i < menus.size(); i++) {
            Menu menu = menus.get(i);
            if (uri.equalsIgnoreCase(menu.getHref().trim())) {
                isInMenu = true;
                logger.debug(uri + " <= this menu is in the menus.  =>" + menu.getHref().trim());
                break;
            }
        }

        if (isInMenu) {
            boolean userHasPerimission = false;
            for (int i = 0; i < userMenus.size(); i++) {
                Menu menu = userMenus.get(i);
                if (uri.equalsIgnoreCase(menu.getHref().trim())) {
                    logger.debug(uri + " <= user has this menu permission. =>" + menu.getHref().trim());
                    userHasPerimission = true;
                }
            }
            return userHasPerimission;
        }


        logger.debug( uri + "<= this menu is not in the menus, every one can visit.");
        return true;


    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
