package com.we.controller;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowapply;
import com.we.common.Pager;
import com.we.service.BorrowapplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/borrowapply")
public class BorrowapplyController {

    private BorrowapplyService borrowapplyService;

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Borrowapply borrowapply) {
        RequestResultVO vo = null;
        try{
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
    @RequestMapping("list_borrowapply")
    @ResponseBody
    public Pager listBorrowapply(Long offset, Long limit, Borrowapply borrowapply) {
        return borrowapplyService.listCriteria(offset, limit, borrowapply);
    }

    @Resource
    public void setBorrowapplyService(BorrowapplyService borrowapplyService) {
        this.borrowapplyService = borrowapplyService;
    }
}
