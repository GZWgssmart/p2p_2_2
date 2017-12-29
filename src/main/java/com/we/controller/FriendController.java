package com.we.controller;

import com.we.bean.Friend;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.FriendService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/friend")
public class FriendController {

    private FriendService friendService;

    //跳转到合作伙伴页面
    @RequestMapping("friend")
    public String page() {
        return null;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Friend friend,BindingResult bindingResult) {
        RequestResultVO vo = null;
        try{
            if(bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }else {
                friendService.updateSelective(friend);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Friend friend) {
        RequestResultVO vo = null;
        try{
            friendService.save(friend);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Friend friend) {
        return friendService.listCriteria(offset,limit,friend);
    }


    @Autowired
    public void setFriendService(FriendService friendService) {
        this.friendService = friendService;
    }



}
