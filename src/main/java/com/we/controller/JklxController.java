package com.we.controller;

import com.we.bean.Jklx;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.JklxService;
import com.we.vo.ComboboxVO;
import com.we.vo.ListIntegerVO;
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

    @RequestMapping("all_jklx_page")
    public String AllJklxPage() {
        return "jklx/allJklx";
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Jklx jklx) {
        RequestResultVO vo = null;
        try {
            jklxService.saveSelective(jklx);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("list_combobox")
    @ResponseBody
    public List<ComboboxVO> listCombobox() {
        return jklxService.listCombobox();
    }


    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Jklx jklx) {
        RequestResultVO vo = null;
        try {
            jklxService.updateSelective(jklx);
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
        jklxService.removeByIds(listIntegerVO.getIds());
        vo = RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
        return vo;
    }


    @RequestMapping("updateState")
    @ResponseBody
    public RequestResultVO updateState(Integer jklxid, String state) {
        RequestResultVO vo = null;
        Jklx jklx = new Jklx();
        jklx.setLxid(jklxid);
        if ("激活".equals(state)) {
            jklx.setState(1);
        } else if ("冻结".equals(state)) {
            jklx.setState(0);
        }
        jklxService.updateSelective(jklx);
        vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit,Jklx jklx) {
        return jklxService.listCriteria(offset, limit, jklx);
    }

    @Resource
    public void setJklxService(JklxService jklxService) {
        this.jklxService = jklxService;
    }
}
