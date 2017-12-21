package com.we.dao;

import com.we.bean.Letter;

public interface LetterDAO extends BaseDAO {
    int removeById(Integer lid);

    int save(Letter record);

    int saveSelective(Letter record);

    Letter getById(Integer lid);

    int updateSelective(Letter record);

    int updateByPrimaryKeyWithBLOBs(Letter record);

    int update(Letter record);
}