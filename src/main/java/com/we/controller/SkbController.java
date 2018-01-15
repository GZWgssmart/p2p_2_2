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

    /**
     * 前台用户 选中已还款的数据进行收款
     * @param skid
     * @param session
     * @return
     */
    @RequestMapping("save_gathering")
    @ResponseBody
    public RequestResultVO saveGathering(Integer skid, HttpSession session) {
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        return skbService.saveGathering(user.getUid(), skid);
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
        return skbService.saveListCriteria(offset, limit, skb);
    }


    @Resource
    public void setSkbService(SkbService skbService) {
        this.skbService = skbService;
    }

}
