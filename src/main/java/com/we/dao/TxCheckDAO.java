package com.we.dao;

import com.we.bean.TxCheck;

public interface TxCheckDAO extends BaseDAO {
    int removeById(Integer rcid);

    int save(TxCheck record);

    int saveSelective(TxCheck record);

    TxCheck getById(Integer rcid);

    int updateSelective(TxCheck record);

    int update(TxCheck record);
}