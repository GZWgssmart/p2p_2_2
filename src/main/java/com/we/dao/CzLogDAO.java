package com.we.dao;

import com.we.bean.CzLog;

public interface CzLogDAO extends BaseDAO {
    int removeById(Integer czid);

    int save(CzLog record);

    int saveSelective(CzLog record);

    CzLog getById(Integer czid);

    int updateSelective(CzLog record);

    int update(CzLog record);
}