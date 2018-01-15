package com.we.service.impl;

import com.we.bean.Notice;
import com.we.common.Pager;
import com.we.dao.NoticeDAO;
import com.we.service.AbstractBaseService;
import com.we.service.NoticeService;
import com.we.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NoticeServiceImpl extends AbstractBaseService implements NoticeService {

    private NoticeDAO noticeDAO;

    @Autowired
    public void setNoticeDAO(NoticeDAO noticeDAO) {
        super.setBaseDAO(noticeDAO);
        this.noticeDAO = noticeDAO;
    }

    @Override
    public Pager listAllNotice(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(noticeDAO.listAllNotice(pager, query));
        pager.setTotal(noticeDAO.countAllNotice(query));
        return pager;
    }

    @Override
    public Long countAllNotice(Object obj) {
        return noticeDAO.countAllNotice(obj);
    }

    @Override
    public Pager listAllPagerNotice(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(noticeDAO.listAllPageNotice(pager, query));
        pager.setTotal(noticeDAO.countAllNotice(query));
        return pager;
    }

    @Override
    public Long countAllPagerNotice(Object obj) {
        return noticeDAO.countAllPagerNotice(obj);
    }

    @Override
    public List<Notice> listQueryAllNotice() {
        return noticeDAO.listQueryAllNotice();
    }

    @Override
    public List<NoticeVO> listNotice() {
        return noticeDAO.listNotice();
    }


}
