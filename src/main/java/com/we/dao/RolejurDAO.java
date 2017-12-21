package com.we.dao;

import com.we.bean.Rolejur;

public interface RolejurDAO extends BaseDAO {
    int removeById(Integer rjid);

    int save(Rolejur record);

    int saveSelective(Rolejur record);

    Rolejur getById(Integer rjid);

    int updateSelective(Rolejur record);

    int update(Rolejur record);
}