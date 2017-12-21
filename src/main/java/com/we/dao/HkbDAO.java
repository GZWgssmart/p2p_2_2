package com.we.dao;

import com.we.bean.Hkb;

public interface HkbDAO extends BaseDAO {
    int removeById(Integer skid);

    int save(Hkb record);

    int saveSelective(Hkb record);

    Hkb getById(Integer skid);

    int updateSelective(Hkb record);

    int update(Hkb record);
}