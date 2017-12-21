package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.NoticeDAO;
import com.we.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class NoticeServiceImpl implements NoticeService {

    private NoticeDAO noticeDAO;

    @Override
    public int removeById(Long id) {
        return noticeDAO.removeById(id);
    }

    @Override
    public int save(Object obj) {
        return noticeDAO.save(obj);
    }

    @Override
    public int saveSelective(Object obj) {
        return noticeDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return noticeDAO.getById(id);
    }

    @Override
    public int updateSelective(Object obj) {
        return noticeDAO.updateSelective(obj);
    }

    @Override
    public int update(Object obj) {
        return noticeDAO.update(obj);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
       Pager pager = new Pager(offset,limit);
       pager.setRows(noticeDAO.listCriteria(pager,object));
       pager.setTotal(noticeDAO.countCriteria(object));
        return pager;
    }

    @Resource
    public void setNoticeDAO(NoticeDAO noticeDAO) {
        this.noticeDAO = noticeDAO;
    }
}
