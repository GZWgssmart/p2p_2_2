package com.we.dao;

import com.we.bean.Roleuser;

public interface RoleuserDAO extends BaseDAO {
    int removeById(Integer ruid);

    int save(Roleuser record);

    int saveSelective(Roleuser record);

    Roleuser getById(Integer ruid);

    int updateSelective(Roleuser record);

    int update(Roleuser record);
}