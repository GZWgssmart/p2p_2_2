package com.we.dao;

import org.springframework.stereotype.Repository;

@Repository

public interface RewardSettingDAO extends BaseDAO {

    Double getPercentByMoney(Integer money);

}