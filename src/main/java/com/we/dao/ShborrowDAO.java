package com.we.dao;

import com.we.bean.Shborrow;

public interface ShborrowDAO extends BaseDAO {
    int removeById(Integer shid);

    int save(Shborrow record);

    int saveSelective(Shborrow record);

    Shborrow getById(Integer shid);

    int updateSelective(Shborrow record);

    int update(Shborrow record);
}