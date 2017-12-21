package com.we.dao;

import com.we.bean.Option;

public interface OptionDAO extends BaseDAO {
    int removeById(Integer opid);

    int save(Option record);

    int saveSelective(Option record);

    Option getById(Integer opid);

    int updateSelective(Option record);

    int updateByPrimaryKeyWithBLOBs(Option record);

    int update(Option record);
}