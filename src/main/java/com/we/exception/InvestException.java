package com.we.exception;

import com.we.enums.RequestResultEnum;

/**
 * Created on 2018/1/9 19:02
 *用户投资所遇到的异常
 * @author mh
 */
public class InvestException extends RuntimeException {

    private Integer code;

    public InvestException() {

    }

    public InvestException(RequestResultEnum resultEnum) {
        super(resultEnum.getMessage());
        this.code = resultEnum.getCode();
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
