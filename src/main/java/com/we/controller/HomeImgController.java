package com.we.controller;

import com.we.bean.HomeImg;
import com.we.bean.Media;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.HomeImgService;
import com.we.service.MediaService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

/**
 * Created by ID.LQF on 2018/1/2.
 */
@Controller
@RequestMapping("/homeImg")
public class HomeImgController {

    @Autowired
    private HomeImgService homeImgService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return homeImgService.listCriteria(offset,limit,null);
    }

    @RequestMapping("save")
    @ResponseBody
    public RequestResultVO save(HomeImg homeImg, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            homeImg.setImgpath(OurConstants.PERFIX_IMG_PATH + homeImg.getImgpath());
            homeImgService.save(homeImg);
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
    public RequestResultVO update(HomeImg homeImg, MultipartFile file) {
        RequestResultVO resultVO = null;
        try {
            homeImg.setHid(homeImg.getHid());
            if (!homeImg.getImgpath().equals("") && homeImg.getImgpath() != null) {
                String imgPath = PathUtils.mkUploadImgs();
                file.transferTo(new File(imgPath, file.getOriginalFilename()));
                homeImg.setImgpath(OurConstants.PERFIX_IMG_PATH + homeImg.getImgpath());
            }
            homeImg.setImghref(homeImg.getImghref());
            homeImgService.updateSelective(homeImg);
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
     * 查询前5个首页图片的数据
     * @return
     */
    @RequestMapping("list_homeimg")
    @ResponseBody
    public List<HomeImg> listHomeImg() {
        List<HomeImg> homeImgs = homeImgService.listHomeImg();
        return homeImgs;
    }

}
