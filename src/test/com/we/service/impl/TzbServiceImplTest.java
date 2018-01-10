package com.we.service.impl;

import com.we.dto.TzbDTO;
import com.we.service.TzbService;
import org.junit.Test;

import javax.annotation.Resource;
import java.math.BigDecimal;

public class TzbServiceImplTest extends BaseTest {

    private TzbService tzbService;

    @Test
    public void save() throws Exception {
        TzbDTO tzbDTO = new TzbDTO();
        tzbDTO.setBaid(18);
        tzbDTO.setCpname("PJB1515457882799");
        tzbDTO.setJuid(100001);
        tzbDTO.setUid(100000);
        tzbDTO.setTid(1);
        tzbDTO.setMoney(new BigDecimal(460000));
        tzbDTO.setNprofit(new BigDecimal(8));
        tzbService.save(tzbDTO);
    }

    @Test
    public void testInteger() {
        Integer a = new Integer(10000);
        Integer b = new Integer(10000);
        System.out.println(a == b);
        System.out.println(b.equals(a));
    }

    @Resource
    public void setTzbService(TzbService tzbService) {
        this.tzbService = tzbService;
    }
}