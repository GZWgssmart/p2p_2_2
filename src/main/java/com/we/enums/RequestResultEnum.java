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
    Code_SUCCESS(306,"fail","验证码已发送，请注意查收"),
    HAVE_PERMISSION(401, "success", "通过认证"),
    NO_PERMISSION(402, "fail", "无权限操作"),
    NO_PERMISSION_BORROW_MONEY(403, "fail", "（充值10000元，投标1000元可申请）成为VIP才能开启借款功能"),
    VERIFY_SUCCESS(307,"success","验证成功"),
    VERIFY_FAIL(308,"fail","验证码错误"),
    UPDATE_UPWD_SUCCESS(309,"success","修改密码成功"),
    ADD_EMAIL_SUCCESS(310,"success","添加邮箱成功"),
    UPDATE_PHONE_SUCCESS(311,"success","修改成功"),
    CHECK_OK(313,"success","审核通过"),
    CHECK_NO(314,"success","提交审核理由成功"),
    BINDING_BANKCARD_SUCCESS(315,"success","绑定银行卡成功"),
    OLD_PWD_FAIL(312,"fail","原始密码错误"),
    SAME_TZ_JK(601, "fail", "不能投自身发布的标"),
    BORROW_SYMONEY_NOT_ENOUGH(603, "fail", "剩余可投金额不足"),
    USERMONEY_KYMONEY_NOT_ENOUGH(604, "fail", "可用余额不足"),
    TICKET_DISABLED(605, "fail", "此优惠券已失效"),
    NEW_PWDS_IS_DIFFERENT(606, "fail", "两次输入的新密码不一致"),
    HK_SUCCESS(205, "success", "还款成功！"),
    HK_FAIL(505, "fail", "还款失败，请稍后再试！"),
    HK_FAIL_ZPWD(506, "fail", "还款失败，支付密码错误"),
    PAY_PWD_ERROR(507, "fail", "支付密码错误"),
    PAY_PWD_TRUE(508, "success", "支付密码正确"),
    SK_SUCCESS(206, "success", "收款成功！");

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
