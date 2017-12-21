package com.we.dao;

import com.we.bean.Skb;

public interface SkbDAO extends BaseDAO {
    int removeById(Integer skid);

    int save(Skb record);

    int saveSelective(Skb record);

    Skb getById(Integer skid);

    int updateSelective(Skb record);

    int update(Skb record);
}