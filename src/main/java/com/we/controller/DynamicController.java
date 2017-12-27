package com.we.controller;

import com.we.bean.Dynamic;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.DynamicService;
import com.we.vo.RequestResultVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;

/**
 * Created by ID.LQF on 2017/12/25.
 */
@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    @RequestMapping("list_dynamic")
    @ResponseBody
    public Pager listPager(Long offset, Long limit) {
        return dynamicService.listCriteria(offset,limit,null);
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Dynamic dynamic) {
        RequestResultVO resultVO = null;
        dynamic.setDate(Calendar.getInstance().getTime());
        try {
            dynamicService.save(dynamic);
        } catch (RuntimeException e) {
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        resultVO = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        return resultVO;
    }

}
