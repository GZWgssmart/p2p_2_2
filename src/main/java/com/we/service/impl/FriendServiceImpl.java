package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.FriendDAO;
import com.we.service.FriendService;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService {

    private FriendDAO friendDAO;

    @Override
    public int removeById(Long id) {
        return 0;
    }

    @Override
    public int save(Object obj) {
        return 0;
    }

    @Override
    public int saveSelective(Object obj) {
        return 0;
    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public int updateSelective(Object obj) {
        return 0;
    }

    @Override
    public int update(Object obj) {
        return 0;
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        return null;
    }
}
