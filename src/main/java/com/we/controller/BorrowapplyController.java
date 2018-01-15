package com.we.controller;

import com.we.bean.*;
import com.we.bean.Borrowapply;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.query.InvestBorrowQuery;
import com.we.service.BorrowapplyService;
import com.we.service.TzbService;
import com.we.vo.BorrowapplyInvestVO;
import com.we.vo.BorrowdetailAndWapplyVO;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/borrowapply")
public class BorrowapplyController {

    private BorrowapplyService borrowapplyService;

    @Autowired
    private TzbService tzbService;
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

    @RequestMapping("pager_criteria_byinvest")
    @ResponseBody
    public List<BorrowapplyInvestVO> pagerInvest(String xmqx1, String xmqx2, String nysy1, String nysy2, String xmlx1, String search) {
        List<BorrowapplyInvestVO> borrowapplyInvestVOList = borrowapplyService.listByInvest(xmqx1,xmqx2,nysy1,nysy2,xmlx1,search);
        List<BorrowapplyInvestVO> borrowapplyInvestVOList1 = new ArrayList<>();
        for(BorrowapplyInvestVO borrowapplyInvestVO : borrowapplyInvestVOList){
            System.out.println(borrowapplyInvestVO);
            BorrowapplyInvestVO borrowapplyInvestVO1 = new BorrowapplyInvestVO();
            //baid
            borrowapplyInvestVO1.setBaid(borrowapplyInvestVO.getBaid());
            //产品名称
            borrowapplyInvestVO1.setCpname(borrowapplyInvestVO.getCpname());
            //募资金额
            borrowapplyInvestVO1.setMoney(borrowapplyInvestVO.getMoney());
            //年化收益
            borrowapplyInvestVO1.setNprofit(borrowapplyInvestVO.getNprofit());
            //项目期限
            borrowapplyInvestVO1.setTerm(borrowapplyInvestVO.getTerm());
            //还款方式
            borrowapplyInvestVO1.setBzname(borrowapplyInvestVO.getBzname());
            //借款类型
            borrowapplyInvestVO1.setLxname(borrowapplyInvestVO.getLxname());
            //状态
            borrowapplyInvestVO1.setState(borrowapplyInvestVO.getState());
            //已投金额
            Double monty = tzbService.sunMoneyByBaid(borrowapplyInvestVO.getBaid());
            borrowapplyInvestVO1.setNowmoney(BigDecimal.valueOf(monty));
            //可投金额
            borrowapplyInvestVO1.setElseMoney(borrowapplyInvestVO1.getMoney().subtract(borrowapplyInvestVO1.getNowmoney()));
            //进度
            borrowapplyInvestVO1.setJindu(BigDecimal.valueOf(monty * 100).divide(borrowapplyInvestVO.getMoney(),2, RoundingMode.CEILING));

            borrowapplyInvestVOList1.add(borrowapplyInvestVO1);
        }
        return borrowapplyInvestVOList1;
    }

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }

}
