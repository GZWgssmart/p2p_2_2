package com.we.service.impl;

import com.we.common.Pager;
import com.we.service.MoneyLogService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ID.LQF on 2018/1/19.
 */
public class MoneyLogServiceTest extends BaseTest {

    @Autowired
    private MoneyLogService moneyLogService;

    @Test
    public void testPagerMoneyLog(){
        Pager pager = moneyLogService.listCriteria(0l,10l,null);
        System.out.println(pager);
    }

    @Test
    public void testMoneyLog(){
        Pager pager = moneyLogService.listQueryDate(0l,10l,null);
        System.out.println(pager);
    }

}
