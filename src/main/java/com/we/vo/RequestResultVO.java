package com.we.vo;

import com.we.enums.RequestResultEnum;

/**
 * Created on 2017/11/23 20:41
 *
 * @author mh
 */
public class RequestResultVO {

    private Integer code;
    private String result;
    private String message;

    public RequestResultVO() {
    }

    public RequestResultVO(Integer code, String result, String message) {
        this.code = code;
        this.result = result;
        this.message = message;
    }

    public static RequestResultVO status(RequestResultEnum statusEnum) {
        return new RequestResultVO(statusEnum.getCode(), statusEnum.getResult(), statusEnum.getMessage());
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
