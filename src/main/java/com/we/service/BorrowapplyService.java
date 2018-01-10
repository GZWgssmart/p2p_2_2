package com.we.service;

import org.apache.ibatis.annotations.Param;

/**
 * Created by hasee on 2017/12/22.
 */
public interface BorrowapplyService extends BaseService {

    /**
     * 总贷款人数
     * @return
     */
    Long countAllBorrowUse();

    /**
     * 总贷款人数
     * @return
     */
    Long countMonthBorrowUse(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 总贷款笔数
     * @return
     */
    Long countAllBorrow();

    /**
     * 月贷款笔数
     * @return
     */
    Long countMonthBorrow(@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 每天的0点整跑一个定时任务： 判断所有处于借款中状态的借款是否流标，已流标则减少已投标用户的 待收总额
     */
    void floater();

    /**
     * 借款成功状态 的借款是否逾期（根据借款id查询还款表数据，若逾期时间小于当前系统时间则逾期）
     */
    void overdue();
}
