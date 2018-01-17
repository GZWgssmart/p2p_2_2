package com.we.controller;

import com.we.bean.Dynamic;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.DynamicService;
import com.we.vo.DynamicVO;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

/**
 * Created by ID.LQF on 2017/12/25.
 */
@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    private DynamicService dynamicService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return dynamicService.listCriteria(offset,limit,null);
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Dynamic dynamic, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            dynamic.setPic(OurConstants.PERFIX_IMG_PATH + dynamic.getPic());
            dynamic.setDate(Calendar.getInstance().getTime());
            dynamicService.save(dynamic);
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return resultVO;
    }

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Dynamic dynamic, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            dynamic.setDyid(dynamic.getDyid());
            if (!dynamic.getPic().equals("")) {
                String imgPath = PathUtils.mkUploadImgs();
                file.transferTo(new File(imgPath, file.getOriginalFilename()));
                dynamic.setPic(OurConstants.PERFIX_IMG_PATH + dynamic.getPic());
            }
            dynamic.setContent(dynamic.getContent());
            dynamicService.updateSelective(dynamic);
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        } catch (RuntimeException e) {
            e.printStackTrace();
            resultVO = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return resultVO;
    }

    /**
     * 查询前4个公司动态
     * @return
     */
    @RequestMapping("list_dynamic")
    @ResponseBody
    public List<DynamicVO> listDynamic() {
        List<DynamicVO> dynamicVOS = dynamicService.listDynamic();
        return dynamicVOS;
    }

    /**
     * 分页查询所有公司动态
     * @return
     */
    @RequestMapping("pager_dynamic")
    @ResponseBody
    public Pager pageMedia(Long pageNo, Long pageSize) {
        Pager pager = dynamicService.pageDynamic(pageNo,pageSize);
        return pager;
    }

    @RequestMapping("ueditor")
    public String uEditor() {
        return "huser/dynamic/uEditor";
    }

}
