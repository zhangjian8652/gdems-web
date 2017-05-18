package com.sword.admin.exception.code;

/**
 * Author: zhangjian
 * Date :2017/5/18.
 * Des:
 */
public enum AuthErrorCode implements ErrorCode {

    NOT_AUTHENTICATE("10000001", "用户未授权"),
    USER_NOT_FOUND("10000002", "用户找不到"),;

    private String code;
    private String message;

    AuthErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }
}