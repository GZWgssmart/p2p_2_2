package com.we.dao;

import com.we.bean.TxLog;

public interface TxLogDAO extends BaseDAO {
    int removeById(Integer tid);

    int save(TxLog record);

    int saveSelective(TxLog record);

    TxLog getById(Integer tid);

    int updateSelective(TxLog record);

    int update(TxLog record);
}