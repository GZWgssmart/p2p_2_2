package com.we.dao;

import com.we.bean.Sway;

public interface SwayDAO extends BaseDAO {
    int removeById(Integer sid);

    int save(Sway record);

    int saveSelective(Sway record);

    Sway getById(Integer sid);

    int updateSelective(Sway record);

    int update(Sway record);
}