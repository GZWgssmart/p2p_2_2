package com.we.service.impl;

import com.we.dto.TzbDTO;
import com.we.service.TzbService;
import com.we.vo.TzbVO;
import org.junit.Test;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

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

    @Test
    public void testGetMoney() {
        List<TzbVO> tzbVOList = tzbService.getAllMoney();
        BigDecimal allMoney = null;
        for (TzbVO tzbVO : tzbVOList) {
            BigDecimal money = tzbVO.getMoney();
            if (allMoney !=null ) {
                allMoney = money.add(allMoney);
            } else {
                allMoney = money;
            }
        }
        System.out.println(allMoney);
    }

    @Resource
    public void setTzbService(TzbService tzbService) {
        this.tzbService = tzbService;
    }
}