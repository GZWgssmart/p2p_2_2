package com.we.dao;

import com.we.bean.Role;

public interface RoleDAO extends BaseDAO {
    int removeById(Integer jid);

    int save(Role record);

    int saveSelective(Role record);

    Role getById(Integer jid);

    int updateSelective(Role record);

    int update(Role record);
}