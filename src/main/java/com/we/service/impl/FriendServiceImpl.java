package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.FriendDAO;
import com.we.service.AbstractBaseService;
import com.we.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class FriendServiceImpl extends AbstractBaseService implements FriendService {


    private FriendDAO friendDAO;

    @Autowired
    public void setFriendDAO(FriendDAO friendDAO) {
        super.setBaseDAO(friendDAO);
        this.friendDAO = friendDAO;
    }
}
