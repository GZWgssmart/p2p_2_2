package com.we.dao;

import com.we.bean.RewardSetting;

public interface RewardSettingDAO extends BaseDAO {
    int removeById(Integer rwid);

    int save(RewardSetting record);

    int saveSelective(RewardSetting record);

    RewardSetting getById(Integer rwid);

    int updateSelective(RewardSetting record);

    int update(RewardSetting record);
}