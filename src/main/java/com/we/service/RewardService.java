package com.we.service;

import com.we.bean.Reward;

/**
 * Created by hasee on 2017/12/22.
 */
public interface RewardService extends BaseService {

    Reward getByIdAndTime(Integer Id, String time);

}
