package com.we.service.impl;

import com.we.bean.Jur;
import com.we.service.JurService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class JurServiceTest extends BaseTest {

    @Autowired
    private JurService jurService;

    @Test
    public void save(){
        Jur jur = new Jur();
        jur.setJurl("user/save");
        jur.setContent("user:save");
        jurService.save(jur);
    }
}
