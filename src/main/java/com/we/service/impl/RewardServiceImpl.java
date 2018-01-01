package com.we.service.impl;

import com.we.bean.Huser;
import com.we.bean.Reward;
import com.we.dao.RecommendDAO;
import com.we.dao.RewardDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 123456 on 2017/12/29.
 */
@Service
public class RewardServiceImpl extends AbstractBaseService implements RewardService{


    private RewardDAO rewardDAO;

    @Autowired
    public void setRewardDAO(RewardDAO rewardDAO) {
        super.setBaseDAO(rewardDAO);
        this.rewardDAO = rewardDAO;
    }

    public Reward getByIdAndTime(Integer id, String time){
        return rewardDAO.getByIdAndTime(id, time);
    }

}
