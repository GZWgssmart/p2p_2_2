package com.we.dao;

import com.we.bean.Bankcard;

public interface BankcardDAO extends BaseDAO {
    int removeById(Integer bcid);

    int save(Bankcard record);

    int saveSelective(Bankcard record);

    Bankcard getById(Integer bcid);

    int updateSelective(Bankcard record);

    int update(Bankcard record);
}