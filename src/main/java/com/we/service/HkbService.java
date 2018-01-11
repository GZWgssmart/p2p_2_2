package com.we.service;

import com.we.bean.Hkb;
import com.we.vo.NowDateVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */
public interface HkbService extends BaseService {
    /**
     * 查询交易总额
     * @return
     */
    void AllMoney();

    /**
     * 以还本金
     * @return
     */
    Integer sumRepayAmount();

    /**
     * 待还笔数
     * @return
     */
    Integer countunRepayNumber();

    /**
     * 逾期金额
     * @return
     */
    Double sumOverdueMoney();

    /**
     * 逾期笔数
     */
    Integer countOverdueNumber();

    /**
     *
     * 执行还款
     * @param uid 前台用户id
     * @param hkid 还款id
     * @return 请求结果
     */
    RequestResultVO repayment(Integer uid, Integer hkid) throws RuntimeException;
}
