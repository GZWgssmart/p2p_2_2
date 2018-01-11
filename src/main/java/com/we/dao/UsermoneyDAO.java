package com.we.dao;

import com.we.bean.Usermoney;
import org.springframework.stereotype.Repository;

@Repository
public interface UsermoneyDAO extends BaseDAO {

    Usermoney getByUid(Integer uid);

    void updateByUid(Object obj);

    void updateByTx(Object obj);

    /**
     * 用户收益总额
     * @return
     */
    Integer sunSymoney();
}