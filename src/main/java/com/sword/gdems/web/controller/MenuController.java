package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.Menu;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.entity.common.EntityUtil;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.NotFoundException;
import com.sword.gdems.web.exception.SwordException;
import com.sword.gdems.web.request.util.RequestUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.MenuService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * @Author zhangjian
 * @Date 2017/3/31
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    private Logger logger = LogManager.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;


    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    public String treeView() {
        return "menu/tree";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listView() {
        return "menu/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String listData(HttpServletRequest request, @RequestParam(name = "id", required = false) String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }
        request.setAttribute("id", id);
        return "menu/data/list";
    }


    @RequestMapping(value = "/list/selected", method = RequestMethod.POST)
    public String listSelectedData(HttpServletRequest request, @RequestParam(name = "id", required = false) String id,@RequestParam(name = "roleId", required = false) String roleId) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }
        request.setAttribute("id", id);

        if (!StringUtils.isEmpty(roleId)) {
            List<Menu> menus = menuService.getByRoleId(roleId);
            if (menus != null && menus.size() > 0) {
                request.setAttribute("selectedMenus",menus);
            }
        }

        return "menu/data/list-selected";
    }



    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addView(HttpServletRequest request) {
        return "menu/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid @ModelAttribute("form") Menu menu, BindingResult result, HttpServletRequest request) throws Exception {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError objectError = errors.get(i);
                logger.error("Menu add request param error:" + objectError.getDefaultMessage());
            }
            throw new InvalidRequestException(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.REUQUEST_CONDIRION_ERROR));
        }

        User user = RequestUtil.getLoginUserFromSession(request);

        //设置baseentity属性，比如createDate,createBy
        EntityUtil.setCommonValue(menu, user);

        //保存菜单
        boolean rst = menuService.save(menu);

        if (!rst) {
            throw new InvalidRequestException(ErrorCodeConfig.INTERNAL_ERROR, ErrorCodeConfig.getMessage(ErrorCodeConfig.INTERNAL_ERROR));
        }

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, ErrorCodeConfig.getMessage(ErrorCodeConfig.SUCCESS));
    }



    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editView(HttpServletRequest request,@RequestParam(name = "id") String id) throws Exception {

        Menu menu =  menuService.getById(id);

        if (menu == null) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "该ID的菜单不存在");
        }
        Menu parentMenu = menuService.getById(menu.getParentId());

        request.setAttribute("menu", menu);
        request.setAttribute("parentMenu", parentMenu);
        return "menu/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@Valid @ModelAttribute("form") Menu menu, BindingResult result, HttpServletRequest request) throws Exception {


        String id = menu.getId();

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "请求更新菜单id不存在");
        }


        Menu menuFromDB = menuService.getById(id);
        menuFromDB.setName(menu.getName());
        menuFromDB.setParentId(StringUtils.isEmpty(menu.getParentId()) ? Menu.NONE_PARENT_ID : menu.getParentId());
        menuFromDB.setHref(menu.getHref());
        menuFromDB.setIsShow(menu.getIsShow());
        menuFromDB.setPermission(menu.getPermission());
        menuFromDB.setSort(menu.getSort());
        menuFromDB.setIcon(menu.getIcon());
        menuFromDB.setIsParent(StringUtils.isEmpty(menu.getParentId()) ? Menu.IS_PARENT :null);

        EntityUtil.setCommonUpdateValue(menuFromDB, RequestUtil.getLoginUserFromSession(request));

        boolean rst = menuService.update(menuFromDB);
        if (!rst) {
            throw new SwordException(HttpStatus.INTERNAL_SERVER_ERROR + "", "更新菜单失败，请联系管理员。");
        }


        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "更新菜单成功");
    }



    @RequestMapping(value = "/exist", method = RequestMethod.POST)
    @ResponseBody
    public boolean exist(@ModelAttribute Menu menu) throws Exception {

        boolean result;
        //当为false时JQuery验证不用过
        if (!StringUtils.isEmpty(menu.getName())) {
            Menu menu1 = new Menu();
            menu1.setName(menu.getName());
            result = menuService.exist(menu1);
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        if (!StringUtils.isEmpty(menu.getPermission())) {
            Menu menu1 = new Menu();
            menu1.setPermission(menu.getPermission());
            result = menuService.exist(menu1);
            //当用户名称已经存在则返回false,这里用户service存在返回true，不存在返回false
            return !result;
        }

        return true;
    }

    @RequestMapping(value = "/selecttree",method = RequestMethod.GET)
    public String selectTree() {
        return "menu/tree-select";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public Object delete(@RequestParam("id") String id) throws Exception {

        if (StringUtils.isEmpty(id)) {
            throw new InvalidRequestException(HttpStatus.BAD_REQUEST + "", "要删除得菜单id不存在");
        }

        menuService.deleteById(id);

        return new JsonResponse<Object>(HttpStatus.ACCEPTED + "", "删除菜单成功");
    }

}
