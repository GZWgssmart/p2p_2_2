package com.we.service.impl;

import com.we.bean.Friend;
import com.we.common.Pager;
import com.we.dao.FriendDAO;
import com.we.service.AbstractBaseService;
import com.we.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FriendServiceImpl extends AbstractBaseService implements FriendService {


    private FriendDAO friendDAO;

    @Autowired
    public void setFriendDAO(FriendDAO friendDAO) {
        super.setBaseDAO(friendDAO);
        this.friendDAO = friendDAO;
    }

    @Override
    public Pager listAllLetter(Long offset, Long limit, Object query) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(friendDAO.listAllLetter(pager, query));
        pager.setTotal(friendDAO.countAllLetter(query));
        return pager;
    }

    @Override
    public Long countAllLetter(Object obj) {
        return friendDAO.countAllLetter(obj);
    }

    @Override
    public List<Friend> listFriend() {
        return friendDAO.listFriend();
    }

}
