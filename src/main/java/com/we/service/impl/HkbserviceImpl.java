package com.we.service.impl;

import com.we.bean.Hkb;
import com.we.bean.User;
import com.we.bean.Ydate;
import com.we.common.DateUtil;
import com.we.dao.HkbDAO;
import com.we.dao.TzbDAO;
import com.we.dao.UserDAO;
import com.we.dao.YdateDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowapplyService;
import com.we.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 123456 on 2018/1/5.
 */
@Service
public class HkbserviceImpl extends AbstractBaseService implements HkbService{

    private HkbDAO hkbDAO;
    @Autowired
    private YdateDAO ydateDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TzbDAO tzbDAO;
    @Autowired
    private BorrowapplyService borrowapplyService;

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO){
        super.setBaseDAO(hkbDAO);
        this.hkbDAO = hkbDAO;
    }

    @Override
    @Transactional
    public void AllMoney() {
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH) + 1;
        String time = "";
        //上个月
        String lastTime = "";
        String lastTimeEnd = "";
        if(month == 1){
            time = String.valueOf(c.get(Calendar.YEAR))+"-01-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR) - 1)+"-12-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR) - 1)+"-12-32";
        }else if(month == 2){
            time = String.valueOf(c.get(Calendar.YEAR))+"-02-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR))+"-01-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR))+"-01-32";
        }else if(2 < month && month <= 10){
            time = String.valueOf(c.get(Calendar.YEAR))+"-0"+month+"-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR))+"-0"+ (month - 1) +"-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR))+"-0"+ (month - 1) +"-32";
        }else if(month == 11){
            time = String.valueOf(c.get(Calendar.YEAR))+"-11-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR))+"-10-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR))+"-10-32";
        }else if(month == 12){
            time = String.valueOf(c.get(Calendar.YEAR))+"-12-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR))+"-11-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR))+"-11-32";
        }
        Ydate ydate = new Ydate();
        ydate.setDate(DateUtil.StringToDate(time));
        //交易总额
        Double allMoney = hkbDAO.getAllMoney();
        ydate.setTmoney(BigDecimal.valueOf(allMoney));

         //每月交易总额    用上月交易总额减上上个月交易总额
            //上上个月没有交易记录 则交易总额为每月交易额
            Ydate lastYdate = ydateDAO.getByDate(lastTime);
            if(lastYdate == null){
                ydate.setMmoney(BigDecimal.valueOf(allMoney));
            }else{
                ydate.setMmoney(BigDecimal.valueOf(allMoney).subtract(lastYdate.getTmoney()));
            }
        //总用户数
        ydate.setTuser(userDAO.countCriteria(User.class).intValue());
        //月注册数
        ydate.setMuser(userDAO.countMonthById(lastTime, lastTimeEnd).intValue());
        //投资总额
        ydate.setTtzno(tzbDAO.countAllMoney().intValue());
        //月投资人数
        ydate.setMtzno(tzbDAO.countUid(lastTime, lastTimeEnd).intValue());
        //总贷款人数
        ydate.setTdkno(borrowapplyService.countAllBorrowUse().intValue());
        //月贷款人数
        ydate.setMdkno(borrowapplyService.countMonthBorrowUse(lastTime, lastTimeEnd).intValue());
        //总贷款笔数
        ydate.setTdkbno(borrowapplyService.countAllBorrow().intValue());
        //月贷款笔数
        ydate.setMdkbno(borrowapplyService.countMonthBorrow(lastTime, lastTimeEnd).intValue());
        ydateDAO.save(ydate);
    }
}
