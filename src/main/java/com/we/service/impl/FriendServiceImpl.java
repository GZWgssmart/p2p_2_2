package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.FriendDAO;
import com.we.service.FriendService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class FriendServiceImpl implements FriendService {

    private FriendDAO friendDAO;

    @Override
    public int removeById(Long id) {
        return friendDAO.removeById(id);
    }

    @Override
    public int save(Object obj) {
        return friendDAO.save(obj);
    }

    @Override
    public int saveSelective(Object obj) {
        return friendDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return friendDAO.getById(id);
    }

    @Override
    public int updateSelective(Object obj) {
        return friendDAO.updateSelective(obj);
    }

    @Override
    public int update(Object obj) {
        return friendDAO.update(obj);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
       Pager pager = new Pager(offset,limit);
       pager.setRows(friendDAO.listCriteria(pager,object));
       pager.setTotal(friendDAO.countCriteria(object));
        return pager;
    }

    @Resource
    public void setFriendDAO(FriendDAO friendDAO) {
        this.friendDAO = friendDAO;
    }
}
