package com.we.dao;

import com.we.bean.Friend;

public interface FriendDAO extends BaseDAO {
    int removeById(Integer fid);

    int save(Friend record);

    int saveSelective(Friend record);

    Friend getById(Integer fid);

    int updateSelective(Friend record);

    int update(Friend record);
}