package com.we.controller;

import com.we.bean.Bz;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.BzService;
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
@RequestMapping("/bz")
public class BzController {

    private BzService bzService;

    @RequestMapping("all_bz_page")
    public String AllBzPage() {
        return "bz/allBz";
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Bz bz) {
        RequestResultVO vo = null;
        try {
            bzService.saveSelective(bz);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Bz bz) {
        RequestResultVO vo = null;
        try {
            bzService.updateSelective(bz);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("remove")
    @ResponseBody
    public RequestResultVO remove(ListIntegerVO listIntegerVO) {
        RequestResultVO vo = null;
        bzService.removeByIds(listIntegerVO.getIds());
        vo = RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
        return vo;
    }

    @RequestMapping("updateState")
    @ResponseBody
    public RequestResultVO updateState(Integer bzid, String state) {
        RequestResultVO vo = null;
        Bz bz = new Bz();
        bz.setBzid(bzid);
        if ("激活".equals(state)) {
            bz.setState(1);
        } else if ("冻结".equals(state)) {
            bz.setState(0);
        }
        bzService.updateSelective(bz);
        vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Bz bz) {
        return bzService.listCriteria(offset, limit, bz);
    }

    @RequestMapping("all_bz")
    @ResponseBody
    public List<String> listAllBz(){
        return bzService.listByBzmame();
    }

    @Resource
    public void setBzService(BzService bzService) {
        this.bzService = bzService;
    }
}
