package com.we.service;

import com.we.bean.Usermoney;

/**
 * Created by hasee on 2017/12/22.
 */
public interface UsermoneyService extends BaseService {

    Usermoney getByUid(Integer uid);

    void updateByUid(Object obj);

    void updateByTx(Object obj);
    /**
     * 用户收益总额
     * @return
     */
    Integer sunSymoney();
}
