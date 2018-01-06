package com.we.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface HkbDAO extends BaseDAO {

    /**
     * 查询交易总额
     * @return
     */
    Double getAllMoney();


}