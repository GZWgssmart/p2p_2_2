package com.we.dao;

import com.we.bean.Usermoney;

public interface UsermoneyDAO extends BaseDAO {

    Usermoney getByUid(Integer uid);
}