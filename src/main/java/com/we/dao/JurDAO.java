package com.we.dao;

import com.we.bean.Jur;

public interface JurDAO extends BaseDAO {
    int removeById(Integer jid);

    int save(Jur record);

    int saveSelective(Jur record);

    Jur getById(Integer jid);

    int updateSelective(Jur record);

    int update(Jur record);
}