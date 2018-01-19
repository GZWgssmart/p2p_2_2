package com.we.service;

import com.we.dto.TxAndCz;
import com.we.vo.RequestResultVO;

import com.we.common.Pager;

/**
 * Created by hasee on 2017/12/22.
 */
public interface MoneyLogService extends BaseService {

    /**
     * 提现
     * @param tx
     * @return
     */
    RequestResultVO tx(TxAndCz tx);

    /**
     * 充值
     * @param cz
     * @return
     */
    RequestResultVO cz(TxAndCz cz);

    /**
     * 根据时间分页查询
     * @param offset 开始索引
     * @param limit 查询数
     * @param object 条件对象
     * @return 分页对象
     */
    Pager listQueryDate(Long offset, Long limit, Object object);

}
