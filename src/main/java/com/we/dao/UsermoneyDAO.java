package com.we.dao;

import com.we.bean.Usermoney;

public interface UsermoneyDAO extends BaseDAO {
    int removeById(Integer umid);

    int save(Usermoney record);

    int saveSelective(Usermoney record);

    Usermoney getById(Integer umid);

    int updateSelective(Usermoney record);

    int update(Usermoney record);
}