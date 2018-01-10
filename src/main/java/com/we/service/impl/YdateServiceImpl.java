package com.we.service.impl;

import com.we.bean.Ydate;
import com.we.dao.UserDAO;
import com.we.dao.YdateDAO;
import com.we.service.AbstractBaseService;
import com.we.service.YdateService;
import com.we.vo.YdataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 123456 on 2018/1/5.
 */
@Service
public class YdateServiceImpl extends AbstractBaseService implements YdateService{

    private YdateDAO ydateDAO;

    @Autowired
    public void YdateDAO(YdateDAO ydateDAO) {
        super.setBaseDAO(ydateDAO);
        this.ydateDAO = ydateDAO;
    }

    @Override
    public Ydate getByDate(String time) {
        return ydateDAO.getByDate(time);
    }

    @Override
    public List<YdataVo> getYearYdate() {
        return ydateDAO.getYearYdate();
    }
}
