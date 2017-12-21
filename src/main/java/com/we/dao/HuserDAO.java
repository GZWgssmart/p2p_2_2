package com.we.dao;

import com.we.bean.Huser;

public interface HuserDAO extends BaseDAO {
    int removeById(Integer huid);

    int save(Huser record);

    int saveSelective(Huser record);

    Huser getById(Integer huid);

    int updateSelective(Huser record);

    int update(Huser record);
}