package com.we.service.impl;

import com.we.service.UserLetterService;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

public class UserLetterServiceImplTest extends BaseTest {

    private UserLetterService userLetterService;
    @Test
    public void testUpdateStatus() throws Exception {
        String ids = "1,2,3";
        userLetterService.updateStatus(ids, "2");
    }

    @Resource
    public void setUserLetterService(UserLetterService userLetterService) {
        this.userLetterService = userLetterService;
    }

}