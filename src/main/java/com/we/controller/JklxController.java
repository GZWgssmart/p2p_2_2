package com.we.controller;

import com.we.bean.Jklx;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.JklxService;
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
@RequestMapping("/jklx")
public class JklxController {

    private JklxService jklxService;

    @RequestMapping("list_combobox")
    @ResponseBody
    public List<ComboboxVO> listCombobox() {
        return jklxService.listCombobox();
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(@Valid Jklx jklx, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try {
            if (bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            } else {
                jklxService.updateSelective(jklx);
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
            }
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Jklx jklx) {
        RequestResultVO vo = null;
        try{
            jklxService.saveSelective(jklx);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Jklx jklx) {
        return jklxService.listCriteria(offset,limit,jklx);
    }

    @Resource
    public void setJklxService(JklxService jklxService) {
        this.jklxService = jklxService;
    }
}
