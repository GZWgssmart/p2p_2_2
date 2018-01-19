package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.BankcardDAO;
import com.we.dao.BaseDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BankcardService;
import com.we.vo.ComboboxVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class BankcardServiceImpl extends AbstractBaseService implements BankcardService {


    private BankcardDAO bankcardDAO;

    @Resource
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        this.bankcardDAO = bankcardDAO;
        super.setBaseDAO(bankcardDAO);
    }

    @Override
    public List<ComboboxVO> listCard(Integer uid) {
        return bankcardDAO.listCard(uid);
    }
}
