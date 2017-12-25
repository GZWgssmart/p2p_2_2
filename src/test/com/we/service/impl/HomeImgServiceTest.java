package com.we.service.impl;

import com.we.bean.HomeImg;
import com.we.service.HomeImgService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ID.LQF on 2017/12/22.
 */
public class HomeImgServiceTest extends BaseTest {

    @Autowired
    private HomeImgService homeImgService;

    @Test
    public void testSave() {
        HomeImg homeImg = new HomeImg();
        homeImg.setImgpath("11111");
        homeImg.setImghref("111111");
        homeImgService.save(homeImg);
    }

    @Test
    public void testUpdate() {
        HomeImg homeImg = new HomeImg();
        homeImg.setHid(1);
        homeImg.setImghref("22222");
        homeImg.setImgpath("22222");
        homeImgService.update(homeImg);
    }

    @Test
    public void testRemoveById() {
        homeImgService.removeById(1);
    }

}
