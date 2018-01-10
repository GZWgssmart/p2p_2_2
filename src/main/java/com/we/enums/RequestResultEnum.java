package com.we.enums;

public enum RequestResultEnum {
    SAVE_SUCCESS(201, "success", "����ɹ���"),
    SAVE_FAIL(501, "fail", "����ʧ�ܣ�"),
    REMOVE_SUCCESS(202, "success", "ɾ���ɹ���"),
    REMOVE_FAIL(502, "fail", "ɾ��ʧ�ܣ�"),
    LOGIN_SUCCESS(203, "success", "��¼�ɹ���"),
    LOGIN_FAIL_ACCOUNT(503, "fail", "�˺Ż��������"),
    LOGIN_FAIL_CODE(503, "fail", "��֤�����"),
    UPDATE_SUCCESS(204,"success","���³ɹ�"),
    UPDATE_FAIL(504,"fail","����ʧ��"),
    REGISTER_SUCCESS(301, "success", "ע��ɹ���"),
    REGISTER_FAIL(302, "fail", "ע��ɹ���"),
    REGISTER_FAIL_HAVE_PHONE(303,"fail","���˺���ע��"),
    UPDATE_UPWD_NO_PHONE(304,"fail","���˺�δע��"),
    REGISTER_FAIL_NOT_TID(305,"fail","�Ƽ��벻����"),
    Code_SUCCESS(306,"fail","��֤���ѷ��ͣ���ע�����"),
    HAVE_PERMISSION(401, "success", "ͨ����֤"),
    NO_PERMISSION(402, "fail", "��Ȩ�޲���"),
    NO_PERMISSION_BORROW_MONEY(403, "fail", "����ֵ10000Ԫ��Ͷ��1000Ԫ�����룩��ΪVIP���ܿ�������"),
    VERIFY_SUCCESS(307,"success","��֤�ɹ�"),
    VERIFY_FAIL(308,"fail","��֤�����"),
    UPDATE_UPWD_SUCCESS(309,"success","�޸�����ɹ�"),
    ADD_EMAIL_SUCCESS(310,"success","�������ɹ�"),
    UPDATE_PHONE_SUCCESS(311,"success","�޸ĳɹ�"),
    UPDSTE_TXCHECK_SUCCESS(313,"success","���ͨ��"),
    UPDSTE_TXCHECK_NO_SUCCESS(314,"success","�ύ������ɳɹ�"),
    OLD_PWD_FAIL(312,"fail","ԭʼ�������"),
    BINDING_BANKCARD_SUCCESS(315,"success","�����п��ɹ�"),
    OLD_PWD_FAIL(312,"fail","ԭʼ�������"),
    SAME_TZ_JK(601, "fail", "����Ͷ�������ı�"),
    BORROW_SYMONEY_NOT_ENOUGH(603, "fail", "ʣ���Ͷ����"),
    USERMONEY_KYMONEY_NOT_ENOUGH(604, "fail", "��������"),
    TICKET_TIME(605, "fail", "�Ż�ȯ�ѹ���");

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
