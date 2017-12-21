package com.we.dao;

import com.we.bean.Rzvip;

public interface RzvipDAO extends BaseDAO {
    int removeById(Integer rid);

    int save(Rzvip record);

    int saveSelective(Rzvip record);

    Rzvip getById(Integer rid);

    int updateSelective(Rzvip record);

    int update(Rzvip record);
}