package com.we.controller;


import com.we.bean.Shborrow;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.ShborrowService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/shborrow")
public class ShborrowController {

    private ShborrowService shborrowService;

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Shborrow shborrow, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try{
            if(bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }else{
                shborrowService.updateSelective(shborrow);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Shborrow shborrow) {
        return shborrowService.listCriteria(offset,limit,shborrow);
    }

    @Resource
    public void setShborrowService(ShborrowService shborrowService) {
        this.shborrowService = shborrowService;
    }
}
