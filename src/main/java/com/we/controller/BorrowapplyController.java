package com.we.controller;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowapply;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.BorrowapplyService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Calendar;

@Controller
@RequestMapping("/borrowapply")
public class BorrowapplyController {

    private BorrowapplyService borrowapplyService;

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Borrowapply borrowapply) {
        RequestResultVO vo = null;
        try{
            borrowapply.setTime(Calendar.getInstance().getTime());
            borrowapplyService.saveSelective(borrowapply);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
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

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }
}
