package com.we.dao;

import com.we.bean.Recommend;

public interface RecommendDAO extends BaseDAO {
    int removeById(Integer rid);

    int save(Recommend record);

    int saveSelective(Recommend record);

    Recommend getById(Integer rid);

    int updateSelective(Recommend record);

    int update(Recommend record);
}