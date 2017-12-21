package com.we.dao;

import com.we.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends BaseDAO {
    int removeById(Integer uid);

    int save(User record);

    int saveSelective(User record);

    User getById(Integer uid);

    int updateSelective(User record);

    int update(User record);

    String isPhone(String phone);

    String isId(Integer id);
}