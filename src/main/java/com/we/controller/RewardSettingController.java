package com.we.controller;

import com.we.bean.RewardSetting;
import com.we.common.Pager;
import com.we.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("rewardSetting")
public class RewardSettingController {

    private RewardSettingService rewardSettingService;

    /***
     * 投资奖励设置分页查询
     * @param offset 开始索引
     * @param limit 索引个数
     * @param rewardSetting 接收页面传替值
     * @return 带结果返回
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, RewardSetting rewardSetting) {
        return rewardSettingService.listCriteria(offset,limit,rewardSetting);
    }

    @Resource
    public void setRewardSettingService(RewardSettingService rewardSettingService) {
        this.rewardSettingService = rewardSettingService;
    }
}
