package com.we.controller;

import com.we.bean.Dxmodel;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.DxmodelService;
import com.we.vo.ComboboxVO;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hasee on 2018/1/17.
 */
@Controller
@RequestMapping("/dxmodel")
public class DxmodelController {
    
    private DxmodelService dxmodelService;

    @RequestMapping("all_dxmodel_page")
    public String AllDxmodelPage() {
        return "dxmodel/allDxmodel";
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Dxmodel dxmodel) {
        RequestResultVO vo = null;
        try {
            dxmodelService.saveSelective(dxmodel);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Dxmodel dxmodel) {
        RequestResultVO vo = null;
        try {
            dxmodel.setDxid(dxmodel.getDxid());
            dxmodelService.updateSelective(dxmodel);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Dxmodel dxmodel) {
        return dxmodelService.listCriteria(offset, limit, dxmodel);
    }

    @Resource
    public void setDxmodelService(DxmodelService dxmodelService) {
        this.dxmodelService = dxmodelService;
    }
}
