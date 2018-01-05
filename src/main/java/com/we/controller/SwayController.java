package com.we.controller;

import com.we.bean.Sway;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.SwayService;
import com.we.vo.ListIntegerVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2017/12/25.
 */
@Controller
@RequestMapping("/sway")
public class SwayController {

    private SwayService swayService;

    @RequestMapping("all_sway_page")
    public String AllSwayPage(){
        return "sway/allSway";
    }


    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Sway sway) {
        RequestResultVO vo = null;
        sway.setState(0);
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
    public RequestResultVO update(Sway sway) {
        RequestResultVO vo = null;
        try{
            swayService.updateSelective(sway);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("remove")
    @ResponseBody
    public String remove(ListIntegerVO listIntegerVO){
        RequestResultVO vo = null;
        swayService.removeByIds(listIntegerVO.getIds());
        vo = RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
        return "remove";
    }

    @RequestMapping("all_sway")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return swayService.listCriteria(offset, limit, Sway.class);
    }

    @RequestMapping("updateState")
    @ResponseBody
    public RequestResultVO updateState(Integer sid, String state) {
        RequestResultVO vo = null;
        Sway sway = new Sway();
        sway.setSid(sid);
        if("激活".equals(state)){
            sway.setState(1);
        }else if("冻结".equals(state)){
            sway.setState(0);
        }
        swayService.updateSelective(sway);
        vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        return vo;
    }

    @Resource
    public void setSwayService(SwayService swayService) {
        this.swayService = swayService;
    }
}
