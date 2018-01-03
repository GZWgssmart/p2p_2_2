package com.we.controller;

import com.we.enums.RequestResultEnum;
import com.we.service.UserLetterService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user_letter")
public class UserLetterController {

   private UserLetterService userletterService;

    /***
     * 更改选中数据的状态
     * @return
     */
    @PostMapping("update_status")
    @ResponseBody
    public RequestResultVO updateStatus(String id, String state) {
        RequestResultVO vo = null;
        try{
            userletterService.updateStatus(id, state);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @Resource
    public void setUserletterService(UserLetterService userletterService) {
        this.userletterService = userletterService;
    }
}
