package com.sword.gdems.web.exception;

/**
 * @Author zhangjian
 * @Date 2017/2/13
 * @Copyright:
 * @Describe:
 */
public class SwordException extends Exception{
    private String errorCode;
    private String message;


    public SwordException(String errorCode, String message) {
        this.errorCode = errorCode;
        this.message = message;
    }


    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
