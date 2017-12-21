package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RewardSettingDAO;
import com.we.service.RewardSettingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RewardSettingServiceImpl implements RewardSettingService  {

    private RewardSettingDAO rewardSettingDAO;

    @Override
    public int removeById(Long id) {
        return rewardSettingDAO.removeById(id);
    }

    @Override
    public int save(Object obj) {
        return rewardSettingDAO.saveSelective(obj);
    }

    @Override
    public int saveSelective(Object obj) {
        return rewardSettingDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return rewardSettingDAO.getById(id);
    }

    @Override
    public int updateSelective(Object obj) {
        return rewardSettingDAO.updateSelective(obj);
    }

    @Override
    public int update(Object obj) {
        return rewardSettingDAO.update(obj);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(rewardSettingDAO.listCriteria(pager,object));
        pager.setTotal(rewardSettingDAO.countCriteria(object));
        return pager;
    }

    @Resource
    public void setRewardSettingDAO(RewardSettingDAO rewardSettingDAO) {
        this.rewardSettingDAO = rewardSettingDAO;
    }
}
