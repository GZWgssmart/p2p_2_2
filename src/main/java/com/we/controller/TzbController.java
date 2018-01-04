package com.we.controller;

import com.we.bean.Tzb;
import com.we.common.Pager;
import com.we.dto.TzbDTO;
import com.we.enums.RequestResultEnum;
import com.we.service.TzbService;
import com.we.vo.RequestResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Calendar;

/**
 * Created by hasee on 2017/12/25.
 */
@Controller
@RequestMapping("/tzb")
public class TzbController {

    private TzbService tzbService;
    private Logger logger = LoggerFactory.getLogger(TzbController.class);

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(TzbDTO tzb) {
        RequestResultVO vo = null;
        try{
            tzbService.save(tzb);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (RuntimeException e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Tzb tzb, BindingResult bindingResult) {
        RequestResultVO vo = null;
        try{
            if(bindingResult.hasErrors()) {
                vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
            }else{
                tzbService.updateSelective(tzb);
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
    public Pager pagerCriteria(Long offset, Long limit, Tzb tzb) {
        return tzbService.listCriteria(offset, limit, tzb);
    }

    @Resource
    public void setTzbService(TzbService tzbService) {
        this.tzbService = tzbService;
    }
}
