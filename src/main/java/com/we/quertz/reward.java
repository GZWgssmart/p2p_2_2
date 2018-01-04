package com.we.quertz;

import com.we.bean.Reward;
import com.we.bean.Usermoney;
import com.we.common.DateUtil;
import com.we.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * 别管这个   测试www
 */
@Component
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:/config/spring-*.xml"})
public class reward implements Job{

    @Autowired
    private RewardService rewardService;

    @Autowired
    private UsermoneyService usermoneyService;

    @Autowired
    private RewardSettingService rewardSettingService;

    @Autowired
    private UserService userService;

    @Transactional
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
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

        //查询投资过的用户
        List<Integer> ids = userService.getUserId();
        for(Integer id : ids) {
            //查询上个季度投资总额
            Reward reward = rewardService.getByIdAndTime(id, lastTime);
            Usermoney usermoney = usermoneyService.getByUid(id);
            int lastMoney = 0;
            int nowMoney = 0;
            int money = 0;
            if (reward != null) {
                //上个季度有投资奖励
                lastMoney = reward.getTmoney().intValue();
                nowMoney = usermoney.getTzmoney().intValue();
                money = nowMoney - lastMoney;
            } else {
                //如果上个季度投资奖励表没有数据  查询用户资金表
                if (!(usermoney == null || usermoney.getTzmoney() == null || usermoney.getTzmoney().equals(BigDecimal.ZERO))) {
                    //为本季度投资总额  (上季度没有投资记录，并且用户资金表投资金额不为空)
                    money = usermoney.getTzmoney().intValue();
                }
            }
            //投资过的用户 计算奖励金额
            if (money != 0) {
                //查询投资奖励比
                Double num = rewardSettingService.getPercentByMoney(money);
                //保存投资总额奖励表(reward)
                //奖励金额
                Double rewardMoney = (double) money * num / 100;
                Reward rewardAdd = new Reward();
                rewardAdd.setUid(id);
                rewardAdd.setTmoney(usermoney.getTzmoney());
                rewardAdd.setDate(DateUtil.StringToDate(nowTime));
                rewardAdd.setMoney(BigDecimal.valueOf(rewardMoney));
                rewardService.save(rewardAdd);

                //修改用户资金表  奖励金额
                if (!(usermoney.getJlmoney() == null || BigDecimal.ZERO.equals(usermoney.getJlmoney()))) {
                    rewardMoney += usermoney.getJlmoney().doubleValue();
                }
                Usermoney usermoneyUpdate = new Usermoney();
                usermoneyUpdate.setUid(id);
                usermoneyUpdate.setJlmoney(BigDecimal.valueOf(rewardMoney));
                usermoneyService.updateByUid(usermoneyUpdate);

                //发送站内信

            }
        }
    }

    public static String IntToString(Integer num){
        return String.valueOf(num);
    }

    @Test
    public void test1(){
        userService.getUserId();
    }
}
