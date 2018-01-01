package com.we.controller;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.we.bean.Huser;
import com.we.bean.Reward;
import com.we.bean.Usermoney;
import com.we.service.HuserService;
import com.we.service.RewardService;
import com.we.service.UsermoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.util.resources.CalendarData;

import java.math.BigDecimal;
import java.util.Calendar;

/**
 * 别管这个   测试www
 */
@Controller
@RequestMapping("/reward")
public class reward {

    @Autowired
    private RewardService rewardService;

    @Autowired
    private UsermoneyService usermoneyService;

    @ResponseBody
    @RequestMapping("quertz")
    public String quertz(){
        Integer id = 1;
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH) + 1;
        //当前时间
        String nowTime = IntToString(c.get(Calendar.YEAR)) + "-" + IntToString(month)+"-" + IntToString(c.get(Calendar.DATE));
        String lastTime = "";
        //获取上季度结算时间
        if(month == 3) {
            lastTime = IntToString(c.get(Calendar.YEAR) - 1) + "-12-" + IntToString(c.get(Calendar.DATE));
        }else{
            lastTime = IntToString(c.get(Calendar.YEAR)) + "-0" + IntToString(month - 3)+"-" + IntToString(c.get(Calendar.DATE));
        }

        //查询上个季度投资总额
        Reward reward = rewardService.getByIdAndTime(id, lastTime);
        int lastMonry = 0;
        int nowMoney = 0;
        int money = 0;
        if(reward != null){
            //上个季度有投资奖励
            lastMonry = rewardService.getByIdAndTime(id, lastTime).getTmoney().intValue();
            nowMoney = usermoneyService.getByUid(id).getTzmoney().intValue();
            money = nowMoney - lastMonry;
        }else{
            //如果上个季度投资奖励表没有数据  查询用户资金表
            Usermoney usermoney = usermoneyService.getByUid(id);
            if(usermoney == null || usermoney.getTzmoney() == null || usermoney.equals(BigDecimal.ZERO)){
                //用户未投资
                return "未投资";
            }else{
                //也为本季度投资总额
                money = usermoney.getTzmoney().intValue();
            }
        }

        //投资过的用户 计算奖励金额
        if(money != 0){
            //查询投资奖励比

        }

        return "1";
    }

    public static String IntToString(Integer num){
        return String.valueOf(num);
    }

}
