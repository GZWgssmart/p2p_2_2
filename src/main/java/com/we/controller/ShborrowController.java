package com.we.controller;


import com.we.bean.Borrowapply;
import com.we.bean.Huser;
import com.we.bean.Shborrow;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.BorrowapplyService;
import com.we.service.ShborrowService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Calendar;

@Controller
@RequestMapping("/shborrow")
public class ShborrowController {

    private ShborrowService shborrowService;
    private BorrowapplyService borrowapplyService;

    @PostMapping("updateStatus")
    @ResponseBody
    public RequestResultVO updateStatus(Shborrow shborrow, HttpSession session) {
        RequestResultVO vo = null;
        try {
            Borrowapply borrowapply = new Borrowapply();
            borrowapply.setBaid(shborrow.getBaid());
            borrowapply.setState(shborrow.getIsok());
            borrowapplyService.updateSelective(borrowapply);
            Huser huser = (Huser) session.getAttribute(OurConstants.SESSION_IN_HUSER);
            shborrow.setHuid(huser.getHuid());
            shborrow.setDate(Calendar.getInstance().getTime());
            shborrowService.updateSelective(shborrow);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Shborrow shborrow, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                shborrowService.updateSelective(shborrow);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    /**
     * 后台用户审核借款
     * @param offset
     * @param limit
     * @param shborrow
     * @return
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Shborrow shborrow, HttpSession session) {
        Huser huser = (Huser) session.getAttribute(OurConstants.SESSION_IN_HUSER);
        shborrow.setHuid(huser.getHuid());
        return shborrowService.listCriteria(offset, limit, shborrow);
    }

    @Resource
    public void setShborrowService(ShborrowService shborrowService) {
        this.shborrowService = shborrowService;
    }

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }
}
