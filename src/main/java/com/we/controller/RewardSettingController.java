package com.we.controller;

import com.we.bean.RewardSetting;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.RewardSettingService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("rewardSetting")
public class RewardSettingController {

    private RewardSettingService rewardSettingService;

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(RewardSetting rewardSetting) {
        RequestResultVO vo = null;
        try{
            rewardSettingService.update(rewardSetting);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    /***
     * 投资奖励的增加
     * @param rewardSetting
     * @return 带结果的返回
     */
    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(RewardSetting rewardSetting) {
        RequestResultVO vo = null;
        try{
            rewardSettingService.save(rewardSetting);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }


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
