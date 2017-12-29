package com.we.controller;

import com.we.bean.Bz;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.BzService;
import com.we.vo.ComboboxVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/bz")
public class BzController {

    private BzService bzService;

    @RequestMapping("list_combobox")
    @ResponseBody
    public List<ComboboxVO> listCombobox() {
        return bzService.listCombobox();
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Bz bz, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                bzService.updateSelective(bz);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Bz bz) {
        RequestResultVO vo = null;
        try{
            bzService.saveSelective(bz);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Bz bz) {
        return bzService.listCriteria(offset,limit,bz);
    }

    @Resource
    public void setBzService(BzService bzService) {
        this.bzService = bzService;
    }
}
