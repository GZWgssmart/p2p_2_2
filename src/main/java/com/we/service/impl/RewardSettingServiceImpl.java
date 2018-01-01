package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RewardSettingDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RewardSettingServiceImpl extends AbstractBaseService implements RewardSettingService  {

    private RewardSettingDAO rewardSettingDAO;

    @Autowired
    public void setRewardSettingDAO(RewardSettingDAO rewardSettingDAO) {
        super.setBaseDAO(rewardSettingDAO);
        this.rewardSettingDAO = rewardSettingDAO;
    }

    @Override
    public Double getPercentByMoney(Integer money) {
        return rewardSettingDAO.getPercentByMoney(money);
    }
}
