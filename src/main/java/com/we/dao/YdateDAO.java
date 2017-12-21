package com.we.dao;

import com.we.bean.Ydate;

public interface YdateDAO extends BaseDAO {
    int removeById(Integer yid);

    int save(Ydate record);

    int saveSelective(Ydate record);

    Ydate getById(Integer yid);

    int updateSelective(Ydate record);

    int update(Ydate record);
}