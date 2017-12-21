package com.we.dao;

import com.we.bean.Bz;

public interface BzDAO extends BaseDAO {
    int removeById(Integer lxid);

    int save(Bz record);

    int saveSelective(Bz record);

    Bz getById(Integer lxid);

    int updateSelective(Bz record);

    int update(Bz record);
}