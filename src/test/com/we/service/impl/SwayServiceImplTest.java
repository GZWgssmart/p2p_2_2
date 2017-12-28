package com.we.service.impl;

import com.we.bean.Sway;
import com.we.service.SwayService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by hasee on 2017/12/22.
 */
public class SwayServiceImplTest extends BaseTest {

    @Autowired
    private SwayService swayService;

    @Test
    public void testSave(){
        Sway sway = new Sway();
        sway.setWay("方式");
        sway.setFw("算法");
        swayService.saveSelective(sway);
    };

    public void testUpdate(){
        Sway sway = new Sway();
        sway.setSid(1);
        sway.setWay("方式1");
        sway.setFw("算法1");
    };

    public void testRemoveById(){
        Sway sway = new Sway();
        sway.getSid();
    };

    public void testListByids(){};

}
