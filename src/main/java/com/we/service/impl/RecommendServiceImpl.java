package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RecommendDAO;
import com.we.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 123456 on 2017/12/22.
 */
@Service
public class RecommendServiceImpl implements RecommendService{

    @Autowired
    private RecommendDAO recommendDAO;

    @Override
    public int removeById(Long id) {
        return 0;
    }

    @Override
    public int save(Object obj) {
        return 0;
    }

    @Override
    public int saveSelective(Object obj) {
        return recommendDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public int updateSelective(Object obj) {
        return 0;
    }

    @Override
    public int update(Object obj) {
        return 0;
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        return null;
    }
}
