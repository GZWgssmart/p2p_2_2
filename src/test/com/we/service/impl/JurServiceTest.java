package com.we.service.impl;

import com.we.bean.Jur;
import com.we.common.Pager;
import com.we.service.JurService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class JurServiceTest extends BaseTest {

    @Autowired
    private JurService jurService;

    @Test
    public void save(){
//        Jur jur = new Jur();
//        jur.setJurl("user/save");
//        jur.setContent("user:save");

        Jur jur = new Jur();
        jur.setJurl("borrow/pass");
        jur.setContent("borrower:pass");
        jurService.save(jur);
    }

    @Test
    public void listByRoleId(){
        Pager pager = jurService.listByRoleId(1);
        for(Object o : pager.getRows()){
            Jur jur = (Jur) o;
            System.out.println(jur);
        }
    }


    @Test
    public void listAll(){
        Pager pager = jurService.listPager(Long.valueOf(0),Long.valueOf(2));
        for(Object o:  pager.getRows()){
            Jur jur = (Jur) o;
            System.out.println(jur);
        }
        System.out.println(pager.getTotal());
    }

}
