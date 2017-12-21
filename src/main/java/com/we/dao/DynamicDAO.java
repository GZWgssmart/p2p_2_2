package com.we.dao;

import com.we.bean.Dynamic;

public interface DynamicDAO extends BaseDAO {
    int removeById(Integer dyid);

    int save(Dynamic record);

    int saveSelective(Dynamic record);

    Dynamic getById(Integer dyid);

    int updateSelective(Dynamic record);

    int updateByPrimaryKeyWithBLOBs(Dynamic record);

    int update(Dynamic record);
}