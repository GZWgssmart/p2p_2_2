package com.we.dao;

import com.we.bean.Bankcard;
import com.we.service.BankcardService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by Administrator on 2017/12/25.
 */
public class BankcardDAOTest {

    private BankcardDAO bankcardDAO;

    @Test
    public void save(){
        Bankcard bankcard = new Bankcard();
        bankcard.setUid(2);
        bankcard.setRname("dsfasf");
        bankcard.setType("1");
        bankcard.setDate(new Date());
        bankcardDAO.save(bankcard);
    }

    @Resource
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        System.out.println("Dsfsdfsdf");
        this.bankcardDAO = bankcardDAO;
    }
}
