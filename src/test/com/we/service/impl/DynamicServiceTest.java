package com.we.service.impl;

import com.we.bean.Dynamic;
import com.we.common.Pager;
import com.we.service.DynamicService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

/**
 * Created by ID.LQF on 2017/12/22.
 */
public class DynamicServiceTest extends BaseTest {

    @Autowired
    private DynamicService dynamicService;

    @Test
    public void testSave() {
        Dynamic dynamic = new Dynamic();
        dynamic.setTitle("天火活动");
        dynamic.setContent("开始就意味这结束");
        dynamic.setPic("22222222");
        dynamic.setDate(Calendar.getInstance().getTime());
        dynamicService.save(dynamic);
    }

    @Test
    public void testUpdate() {
        Dynamic dynamic = new Dynamic();
        dynamic.setDyid(45);
        dynamic.setTitle("123");
        dynamicService.updateSelective(dynamic);
    }

    @Test
    public void testPager() {
        Pager pager = dynamicService.listCriteria(0l,1l,null);
        System.out.println(pager.getRows());
    }

}
