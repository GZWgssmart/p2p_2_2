package com.we.dao;

import com.we.bean.Media;

public interface MediaDAO extends BaseDAO {
    int removeById(Integer mid);

    int save(Media record);

    int saveSelective(Media record);

    Media getById(Integer mid);

    int updateSelective(Media record);

    int updateByPrimaryKeyWithBLOBs(Media record);

    int update(Media record);
}