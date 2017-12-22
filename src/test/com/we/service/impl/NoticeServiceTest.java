package com.we.service.impl;

import com.we.bean.Notice;
import com.we.service.NoticeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

public class NoticeServiceTest extends BaseTest {

    @Autowired
    private NoticeService noticeService;

    @Test
    public void testSave() {
        Notice notice = new Notice();
        notice.setTitle("最新通告");
        notice.setContent("投资100元送10元");
        notice.setDate(Calendar.getInstance().getTime());
        noticeService.save(notice);
    }



}
