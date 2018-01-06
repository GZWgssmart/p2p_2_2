package com.we.common;

/**
 * Created on 2017/12/8 20:47
 *
 * @author mh
 */
public class OurConstants {

    public static final String SESSION_IN_CODE = "code";
    public static final String SESSION_IN_USER = "user";

    public static final Integer IS_VIP = 1;
    public static final Integer NO_VIP = 0;

    /**
     * 上传图片： 图片的路径前缀
     */
    public static final String PERFIX_IMG_PATH = "/static/uploads/img/";

    /**
     * 申请借款的状态：审核中
     */
    public static final Integer BORROW_CHECK = 2;


    /**
     * 资金流向记录的类型：充值
     */
    public static final Integer MONEY_LOG_CZ = 0;

    /**
     * 资金流向记录的类型：提现
     */
    public static final Integer MONEY_LOG_TX = 1;

    /**
     * 资金流向记录的类型：投资
     */
    public static final Integer MONEY_LOG_TZ = 2;

    /**
     * 资金流向记录的类型：回款
     */
    public static final Integer MONEY_LOG_HK = 3;

    /**
     * 标种id：先息后本
     */
    public static final Integer BZ_XXHB = 1;

    /**
     * 标种id：等额本金
     */
    public static final Integer BZ_ACM = 2;

    /**
     * 标种id：等额本息
     */
    public static final Integer BZ_ACPIM= 3;

    /**
     * 标种id：一次还清
     */
    public static final Integer BZ_YCHQ = 4;


    /**
     * 投资表：未还状态
     */
    public static final Integer TZB_WH = 0;

    /**
     * 投资表：已还状态
     */
    public static final Integer TZB_YH = 1;

}
