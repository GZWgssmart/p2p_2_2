package com.we.dao;

import com.we.bean.Tzb;

public interface TzbDAO extends BaseDAO {
    int removeById(Integer sid);

    int save(Tzb record);

    int saveSelective(Tzb record);

    Tzb getById(Integer sid);

    int updateSelective(Tzb record);

    int update(Tzb record);
}