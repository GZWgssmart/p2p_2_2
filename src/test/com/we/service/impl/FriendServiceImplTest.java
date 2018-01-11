package com.we.service.impl;

import com.we.bean.Friend;
import com.we.service.FriendService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by hasee on 2017/12/22.
 */
public class FriendServiceImplTest extends BaseTest {

    @Autowired
    private FriendService friendService;

    @Test
    public void save() throws Exception {
    }

    @Test
    public void getById() throws Exception {
    }

    @Test
    public void update() throws Exception {
    }

    @Test
    public void listFriend(){
        List<Friend> friends = friendService.listFriend();
        System.out.println(friends);
    }

}