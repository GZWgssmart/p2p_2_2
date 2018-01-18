package com.we.service;

import com.we.bean.TxCheck;
import com.we.vo.RequestResultVO;

/**
 * Created by hasee on 2017/12/22.
 */
public interface TxCheckService extends BaseService {

    /**
     *后台用户审核提现
     * @param txCheck
     * @return
     */
    RequestResultVO updateCheck(TxCheck txCheck);
}
