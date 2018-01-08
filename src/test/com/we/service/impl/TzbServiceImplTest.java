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
        tzbDTO.setBaid(11);
        tzbDTO.setCpname("DJB1514874513719");
        tzbDTO.setJuid(100000);
        tzbDTO.setUid(100004);
        tzbDTO.setMoney(new BigDecimal(400000));
        tzbDTO.setNprofit(new BigDecimal(9));
        tzbService.save(tzbDTO);
    }

    @Resource
    public void setTzbService(TzbService tzbService) {
        this.tzbService = tzbService;
    }
}