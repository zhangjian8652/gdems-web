package com.sword.gdems.web.controller;

import com.sword.gdems.web.config.ErrorCodeConfig;
import com.sword.gdems.web.entity.User;
import com.sword.gdems.web.exception.AuthenticationException;
import com.sword.gdems.web.exception.InvalidRequestException;
import com.sword.gdems.web.exception.NotFoundException;
import com.sword.gdems.web.request.entity.UserInfo;
import com.sword.gdems.web.request.util.SessionUtil;
import com.sword.gdems.web.response.JsonResponse;
import com.sword.gdems.web.service.impl.UserAuthor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author zhangjian
 * @Date 2017/3/29
 * @Copyright:
 * @Describe:
 */
@Controller
@RequestMapping("/login")
public class AuthController {

    @Autowired
    private UserAuthor userAuthor;

    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    public Object doLogin(@Validated @ModelAttribute("form") UserInfo userInfo, BindingResult result, HttpServletRequest request) throws Exception {

        //判断输入信息是否正确
        if (result.hasErrors()) {
            String code = result.getAllErrors().get(0).getDefaultMessage();
            throw new InvalidRequestException(code, ErrorCodeConfig.getMessage(code));
        }

        User loginUser = new User();
        loginUser.setLoginName(userInfo.getUsername());
        loginUser.setPassword(userInfo.getPassword());

        //用户认证，认证成功返回用户数据，否则抛出异常
        User user = null;
        try {
            user = userAuthor.auth(loginUser);
        } catch (AuthenticationException e) {
            throw new NotFoundException(e.getErrorCode(), e.getMessage());
        }

        //将用户信息存入session之中
        SessionUtil.setAttribute(request, "USER", user);

        return new JsonResponse<User>(ErrorCodeConfig.SUCCESS, ErrorCodeConfig.getMessage(ErrorCodeConfig.SUCCESS));

    }
}
