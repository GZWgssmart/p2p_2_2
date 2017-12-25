package com.we.service.impl;

import com.we.bean.Recommend;
import com.we.service.RecommendService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

/**
 * Created by ID.LQF on 2017/12/24.
 */
public class RecommendServiceTest extends BaseTest {

    @Autowired
    private RecommendService recommendService;

    @Test
    public void testSave() {
        Recommend recommend = new Recommend();
        recommend.setDate(Calendar.getInstance().getTime());
        recommend.setRid(1);
        recommend.setTid(3);
        recommend.setRname("月光");
        recommend.setDate(Calendar.getInstance().getTime());
        recommend.setTname("勿忘");
        recommendService.save(recommend);
    }

    @Test
    public void testUpdate() {
        Recommend recommend = new Recommend();
        recommend.setUid(1);
        recommend.setDate(Calendar.getInstance().getTime());
        recommend.setRid(3);
        recommend.setTid(1);
        recommend.setRname("月光");
        recommend.setDate(Calendar.getInstance().getTime());
        recommend.setTname("勿忘");
        recommendService.save(recommend);
    }



}
