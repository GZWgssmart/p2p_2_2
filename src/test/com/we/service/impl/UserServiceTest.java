package com.we.service.impl;

import com.we.service.UserService;
import com.we.vo.UserVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceTest extends BaseTest{

    @Autowired
    private UserService userService;

    @Test
    public void count(){
        UserVO userVO = new UserVO();
        userVO.setCount(userService.countUser());
        System.out.println(userVO.getCount());
    }


}
