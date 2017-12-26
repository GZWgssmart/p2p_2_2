package com.we.service.impl;

import com.we.bean.Bankcard;
import com.we.dao.BankcardDAO;
import com.we.service.BankcardService;
import com.we.service.impl.BaseTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by Administrator on 2017/12/25.
 */
public class BankcardDAOTest extends BaseTest {

    private BankcardService bankcardService;

    @Test
    public void save(){
        Bankcard bankcard = new Bankcard();
        bankcard.setUid(2);
        bankcard.setRname("dsfasf");
        bankcard.setType("1");
        bankcard.setDate(new Date());
        bankcardService.save(bankcard);
    }

    @Resource
    public void setBankcardService(BankcardService bankcardDAO) {
        this.bankcardService = bankcardDAO;
    }
}
