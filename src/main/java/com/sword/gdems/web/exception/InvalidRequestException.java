package com.sword.gdems.web.exception;

/**
 * @Author zhangjian
 * @Date 2017/2/13
 * @Copyright:
 * @Describe:
 */
public class InvalidRequestException extends SwordException {
    public InvalidRequestException(String errorCode, String message) {
        super(errorCode, message);
    }
}
