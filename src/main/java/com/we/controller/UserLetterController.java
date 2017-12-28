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

   @Autowired
   private UserLetterService userletterService;

    /***
     * 删除选中的数据
     * @return
     */
    @PostMapping("remove_rows")
    @ResponseBody
    public RequestResultVO removeRows(String id) {
        System.out.println(id);
        RequestResultVO vo = null;
        try{
            userletterService.removeRows(id);
            vo = RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.REMOVE_FAIL);
        }
        return vo;
    }

    @Resource
    public void setUserletterService(UserLetterService userletterService) {
        this.userletterService = userletterService;
    }
}
