package com.we.controller.quertz;

import com.we.bean.Ydate;
import com.we.service.BorrowapplyService;
import com.we.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;

/**
 * 每月一号生成上个月统计
 * Created by 123456 on 2018/1/5.
 */
@Controller
@RequestMapping("/ydate")
public class ydate {

    @Autowired
    private HkbService hkbService;

    @RequestMapping("test")
    @ResponseBody
    public void execute(){

        //查询交易总额
        hkbService.AllMoney();
        //当月交易总额
    }

}
