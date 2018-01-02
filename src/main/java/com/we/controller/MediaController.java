package com.we.controller;

import com.we.bean.Media;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
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
@RequestMapping("/media")
public class MediaController {

    @Autowired
    private MediaService mediaService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return mediaService.listCriteria(offset,limit,null);
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(Media media, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            media.setPic(OurConstants.PERFIX_IMG_PATH + media.getPic());
            media.setUrl(media.getUrl());
            media.setDate(Calendar.getInstance().getTime());
            mediaService.save(media);
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
    public RequestResultVO update(Media media, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            media.setMid(media.getMid());
            if (!media.getPic().equals("")) {
                String imgPath = PathUtils.mkUploadImgs();
                file.transferTo(new File(imgPath, file.getOriginalFilename()));
                media.setPic(OurConstants.PERFIX_IMG_PATH + media.getPic());
            }
            media.setContent(media.getContent());
            mediaService.updateSelective(media);
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

}
