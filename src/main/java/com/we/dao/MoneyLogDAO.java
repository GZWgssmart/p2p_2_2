package com.we.dao;

import com.we.bean.MoneyLog;

public interface MoneyLogDAO extends BaseDAO {
    int removeById(Integer mid);

    int save(MoneyLog record);

    int saveSelective(MoneyLog record);

    MoneyLog getById(Integer mid);

    int updateSelective(MoneyLog record);

    int update(MoneyLog record);
}