package com.sword.admin.exception;

/**
 * @Author zhengzhe
 * @Date 2017/2/13
 * @Copyright:
 * @Describe:
 */
public class AuthenticationException extends SwordException {

    public AuthenticationException(String errorCode, String message) {
        super(errorCode, message);
    }
}
