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
     * 申请借款的状态：借款成功
     */
    public static final Integer BORROW_SUCCESS = 4;

    /**
     * 申请借款的状态：借款失败（流标）
     */
    public static final Integer BORROW_FAIL = 5;

    /**
     * 申请借款的状态：还款成功
     */
    public static final Integer BORROW_REPAY_OK = 6;


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
     * 资金流向记录的类型：收款（回款）
     */
    public static final Integer MONEY_LOG_HK = 3;

    /**
     * 资金流向记录的类型：还款
     */
    public static final Integer MONEY_LOG_REPAY = 4;

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
     * 还款表：未还状态
     */
    public static final Integer HKB_WH = 0;

    /**
     * 还款表：逾期状态
     */
    public static final Integer HKB_YQ = 1;

    /**
     * 还款表：已还状态
     */
    public static final Integer HKB_YH = 2;

    /**
     * 用户优惠券关联：已使用
     */
    public static final Integer TICKET_USE = 0;

    /**
     * 用户优惠券关联：已过期
     */
    public static final Integer TICKET_TIME = 1;

    /**
     * 用户优惠券关联：可用
     */
    public static final Integer TICKET_OK = 2;

    /**
     * 优惠券类型：邀请好友
     */
    public static final Integer  TICKET_INVITE = 1;

    /**
     * 优惠券类型：平台发布
     */
    public static final Integer  TICKET_RELEASE = 2;

    /**
     * 收款表状态：未还款
     */
    public static final Integer SKB_WH = 0;

    /**
     * 收款表状态：已还款
     */
    public static final Integer SKB_YH = 1;

    /**
     * 收款表状态：已收款
     */
    public static final Integer SKB_YS = 2;

    /**
     * 提现记录状态：审核中
     */
    public static final Integer TX_CHECKING = 2;

    /**
     * 提现记录状态：审核通过
     */
    public static final Integer TX_CHECK_OK = 1;

    /**
     * 提现记录状态：审核不通过
     */
    public static final Integer TX_CHECK_NO = 0;


}