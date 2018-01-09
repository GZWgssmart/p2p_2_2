package com.we.controller;

import com.we.bean.Recommend;
import com.we.bean.User;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.query.RecommendQuery;
import com.we.service.RecommendService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;

/**
 * 推荐管理
 * Created by ID.LQF on 2018/1/3.
 */
@Controller
@RequestMapping("/recommend")
public class RecommendController {

    @Autowired
    private RecommendService recommendService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return recommendService.listCriteria(offset,limit,null);
    }

    @RequestMapping("pager_friends")
    @ResponseBody
    public Pager pagerUserFriends(Long offset, Long limit, RecommendQuery query) {
        return recommendService.listUserFriends(offset,limit,query);
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Recommend recommend) {
        RequestResultVO resultVO = null;
        try {
            recommendService.save(recommend);
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return resultVO;
    }

    @RequestMapping("search")
    @ResponseBody
    public Pager search(Long offset, Long limit,RecommendQuery recommendQuery) {
        return recommendService.listCriteria(offset,limit,recommendQuery);
    }

    @RequestMapping("search_friends")
    @ResponseBody
    public Pager searchFriends(Long offset, Long limit,RecommendQuery recommendQuery) {
        return recommendService.listUserFriends(offset,limit,recommendQuery);
    }

    @RequestMapping("invite_friends")
    public String inviteFriends() {
        return "user/recommend/invite_friends";
    }

    @RequestMapping("list_invite_friends")
    public String listInviteFriends() {
        return "user/recommend/all_invite_friends";
    }

}
