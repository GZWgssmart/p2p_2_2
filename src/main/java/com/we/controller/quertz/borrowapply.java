package com.we.controller.quertz;

import com.we.service.BorrowapplyService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

/**
 * 每天的0点整跑一个定时任务： 判断所有处于借款中状态的借款是否流标，已流标则减少已投标用户的 待收总额
 */
@Component
public class borrowapply implements Job{

    @Autowired
    private BorrowapplyService borrowapplyService;

    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
        borrowapplyService.floater();
        borrowapplyService.overdue();
    }

}
