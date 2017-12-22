package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.NoticeDAO;
import com.we.service.AbstractBaseService;
import com.we.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class NoticeServiceImpl extends AbstractBaseService implements NoticeService {

    private NoticeDAO noticeDAO;

    @Autowired
    public void setNoticeDAO(NoticeDAO noticeDAO) {
        super.setBaseDAO(noticeDAO);
        this.noticeDAO = noticeDAO;
    }
}
