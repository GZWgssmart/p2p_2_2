package com.we.controller;

import com.we.bean.*;
import com.we.bean.Borrowapply;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.query.InvestBorrowQuery;
import com.we.service.BorrowapplyService;
import com.we.vo.BorrowdetailAndWapplyVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/borrowapply")
public class BorrowapplyController {

    private BorrowapplyService borrowapplyService;

    /**
     * 前台用户查看已投资的借款
     * @param offset
     * @param limit
     * @param query
     * @return
     */
    @RequestMapping("list_user_invest")
    @ResponseBody
    public Pager listCheckOk(Long offset, Long limit, InvestBorrowQuery query, HttpSession session) {
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        query.setUid(user.getUid());
        return borrowapplyService.listUserInvest(offset, limit, query);
    }

    /**
     * 前台用户查看已发布的借款
     * @param offset
     * @param limit
     * @param borrowapply
     * @return
     */
    @RequestMapping("list_checkok")
    @ResponseBody
    public Pager listCheckOk(Long offset, Long limit, Borrowapply borrowapply, HttpSession session) {
        User user = (User) session.getAttribute(OurConstants.SESSION_IN_USER);
        borrowapply.setUid(user.getUid());
        return borrowapplyService.listCheckOkBorrow(offset, limit, borrowapply);
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Borrowapply borrowapply) {
        RequestResultVO vo = null;
        try{
            borrowapply.setTime(Calendar.getInstance().getTime());
            borrowapply.setSymoney(borrowapply.getMoney());
            borrowapplyService.saveSelective(borrowapply);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Borrowapply borrowapply, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                borrowapplyService.updateSelective(borrowapply);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }
    
    /**
     * 分页查看用户的借款基本信息
     * @param offset 开始索引
     * @param limit 查询个数
     * @param borrowapply 条件查询对象
     * @return 带结果的分页对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Borrowapply borrowapply) {
        return borrowapplyService.listCriteria(offset, limit, borrowapply);
    }

    /**
     * 页面多金宝、普金宝、恒金宝的查询
     * @param type
     * @return
     */
    @RequestMapping("list_borrow")
    @ResponseBody
    public List<BorrowdetailAndWapplyVO> listBorrow(Integer type) {
        List<BorrowdetailAndWapplyVO> borrowes = borrowapplyService.listBorrow(type);
        return borrowes;
    }

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }

}
