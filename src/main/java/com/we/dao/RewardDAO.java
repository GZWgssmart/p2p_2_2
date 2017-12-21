package com.we.dao;

import com.we.bean.Reward;

public interface RewardDAO extends BaseDAO {
    int removeById(Integer umid);

    int save(Reward record);

    int saveSelective(Reward record);

    Reward getById(Integer umid);

    int updateSelective(Reward record);

    int update(Reward record);
}