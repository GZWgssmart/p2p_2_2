package com.we.dao;

import com.we.bean.RzvipCheck;

public interface RzvipCheckDAO extends BaseDAO {
    int removeById(Integer rcid);

    int save(RzvipCheck record);

    int saveSelective(RzvipCheck record);

    RzvipCheck getById(Integer rcid);

    int updateSelective(RzvipCheck record);

    int update(RzvipCheck record);
}