package com.we.enums;

public enum RequestResultEnum {
    SAVE_SUCCESS(201, "success", "保存成功！"),
    SAVE_FAIL(501, "fail", "保存失败！"),
    REMOVE_SUCCESS(202, "success", "删除成功！"),
    REMOVE_FAIL(502, "fail", "删除失败！"),
    LOGIN_SUCCESS(203, "success", "登录成功！"),
    LOGIN_FAIL_ACCOUNT(503, "fail", "账号或密码错误"),
    LOGIN_FAIL_CODE(503, "fail", "验证码错误"),
    UPDATE_SUCCESS(204,"success","更新成功"),
    UPDATE_FAIL(504,"fail","更新失败"),
    REGISTER_SUCCESS(301, "success", "注册成功！"),
    REGISTER_FAIL(302, "fail", "注册成功！"),
    REGISTER_FAIL_HAVE_PHONE(303,"fail","该账号已注册"),
    UPDATE_UPWD_NO_PHONE(304,"fail","该账号未注册"),
    REGISTER_FAIL_NOT_TID(305,"fail","推荐码不存在"),
    UPDATE_UPWD_SENDCODE(306,"fail","验证码已发送，请注意查收");


    private Integer code;
    private String result;
    private String message;

    RequestResultEnum() {
    }

    RequestResultEnum(Integer code, String result, String message) {
        this.code = code;
        this.result = result;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getResult() {
        return result;
    }

    public String getMessage() {
        return message;
    }
}
