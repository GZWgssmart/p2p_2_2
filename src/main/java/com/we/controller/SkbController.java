package com.we.controller;

import com.we.bean.Skb;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.query.InvestBorrowQuery;
import com.we.service.SkbService;
import com.we.vo.BorrowdetailAndWapplyVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/skb")
public class SkbController {

    private SkbService skbService;

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Skb skb, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                skbService.updateSelective(skb);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }
    
    /**
     * 前台用户查看收款列表
     * @param offset 开始索引
     * @param limit 查询个数
     * @param skb 条件查询对象
     * @return 带结果的分页对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Skb skb, HttpSession session) {
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        skb.setUid(user.getUid());
        return skbService.listCriteria(offset, limit, skb);
    }


    @Resource
    public void setSkbService(SkbService skbService) {
        this.skbService = skbService;
    }

}
