package com.we.service.impl;

import com.we.bean.Dynamic;
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
        dynamic.setTitle("圣诞活动");
        dynamic.setContent("活动送姬子，赶快来");
        dynamic.setPic("1212412");
        dynamic.setDate(Calendar.getInstance().getTime());
        dynamicService.save(dynamic);
    }

    @Test
    public void testUpdate() {
        Dynamic dynamic = new Dynamic();
        dynamic.setDyid(1);
        dynamic.setPic("22222222");
        dynamicService.update(dynamic);
    }

}
