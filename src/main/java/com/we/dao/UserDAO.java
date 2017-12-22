package com.we.dao;

import com.we.bean.User;
import org.springframework.stereotype.Repository;

public interface UserDAO extends BaseDAO {

    String isPhone(String phone);

    String isId(Integer id);
}