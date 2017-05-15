package com.sword.admin.response;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;

/**
 * @Author zhengzhe
 * @Date 2017/3/28
 * @Copyright:
 * @Describe:
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JsonResponse<T> {
    private String code;
    private String message;
    private T data;
    private List<T> datas;


    public JsonResponse(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public JsonResponse(T data, List<T> datas) {
        this.data = data;
        this.datas = datas;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }
}
