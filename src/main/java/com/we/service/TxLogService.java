package com.we.service;

import com.we.bean.TxLog;
import com.we.common.Pager;
import com.we.vo.RequestResultVO;

/**
 * Created by hasee on 2017/12/22.
 */
public interface TxLogService extends BaseService {

    /**
     * 查询用户的提现记录
     * @param offset
     * @param limit
     * @param userId
     * @return
     */
    Pager listWithdrawalByUserId(Long offset,Long limit,Integer userId);
}
