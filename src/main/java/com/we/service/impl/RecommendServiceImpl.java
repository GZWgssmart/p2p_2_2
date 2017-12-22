package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RecommendDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 123456 on 2017/12/22.
 */
@Service
public class RecommendServiceImpl extends AbstractBaseService implements RecommendService{

    private RecommendDAO recommendDAO;

    @Autowired
    public void setRecommendDAO(RecommendDAO recommendDAO) {
        super.setBaseDAO(recommendDAO);
        this.recommendDAO = recommendDAO;
    }
}
