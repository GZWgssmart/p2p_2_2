package com.we.dao;

import com.we.bean.Jklx;

public interface JklxDAO extends BaseDAO {
    int removeById(Integer lxid);

    int save(Jklx record);

    int saveSelective(Jklx record);

    Jklx getById(Integer lxid);

    int updateSelective(Jklx record);

    int update(Jklx record);
}