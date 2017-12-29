package com.we.controller;

import com.we.bean.Sway;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.SwayService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by hasee on 2017/12/25.
 */
@Controller
@RequestMapping("/sway")
public class SwayController {

    private SwayService swayService;

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Sway sway) {
        RequestResultVO vo = null;
        try{
            swayService.saveSelective(sway);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Sway sway, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try{
            if(bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }else{
                swayService.updateSelective(sway);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Sway sway) {
        return swayService.listCriteria(offset, limit, sway);
    }

    @Resource
    public void setSwayService(SwayService swayService) {
        this.swayService = swayService;
    }
}
