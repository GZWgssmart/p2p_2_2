package com.we.service.impl;

import com.we.bean.Notice;
import com.we.common.Pager;
import com.we.service.NoticeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class NOticeDAOTest extends BaseTest {

    @Autowired
    private NoticeService noticeService;

    @Test
    public void testNoticeAllPagerNotice() {
        Notice notice = new Notice();
        Pager pager = noticeService.listAllPagerNotice(0l,1l,null);
        System.out.println(pager);
    }


}
