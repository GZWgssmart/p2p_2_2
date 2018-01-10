package com.we.controller;

import com.we.bean.Hkb;
import com.we.bean.Media;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.HkbService;
import com.we.service.MediaService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

/**
 * Created by ID.LQF on 2018/1/2.
 */
@Controller
@RequestMapping("/hkb")
public class HkbController {

    @Autowired
    private HkbService hkbService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, Hkb hkb) {
        return hkbService.listCriteria(offset,limit,hkb);
    }

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Hkb hkb, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            hkbService.updateSelective(hkb);
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return resultVO;
    }

}
